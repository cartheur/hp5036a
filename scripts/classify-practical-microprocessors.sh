#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DOCS_DIR="$ROOT_DIR/docs"
OUT_DIR="$ROOT_DIR/docs-classified"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

PAGE_START="${PAGE_START:-}"
PAGE_END="${PAGE_END:-}"
OUTPUT_NAME="${OUTPUT_NAME:-practical-microprocessors}"
SKIP_IMAGES="${SKIP_IMAGES:-0}"
OCR_DIR="$OUT_DIR/reference/ocr"

normalize_manual_text() {
  awk '
    function trim(s) {
      sub(/^[[:space:]]+/, "", s)
      sub(/[[:space:]]+$/, "", s)
      return s
    }

    function rtrim(s) {
      sub(/[[:space:]]+$/, "", s)
      return s
    }

    function is_scan_insert(line) {
      lower = tolower(line)
      if (lower ~ /artek/) return 1
      if (lower ~ /manuals@/) return 1
      if (lower ~ /welch, mn/) return 1
      if (lower ~ /obsolete technical manuals/) return 1
      if (line ~ /=> *2012/) return 1
      if (lower ~ /^date: 2012\./) return 1
      if (line ~ /^OUT OF PRINT$/) return 1
      if (line ~ /^HEWLETT PACKARD MANUAL SCANS$/) return 1
      if (line ~ /^DIGITALY REMASTERED$/) return 1
      if (line ~ /^SCANS$/) return 1
      if (line ~ /^By$/ && last_nonempty == "SCANS") return 1
      return 0
    }

    function detect_page_kind() {
      page_kind = "plain"
      for (k = 1; k <= line_count; k++) {
        probe = trim(page_lines[k])
        if (probe == "LIST OF FIGURES" || probe == "LIST OF TABLES") {
          page_kind = "list"
          return
        }
        if (probe ~ /^Figure [0-9]+-[0-9]+/ || probe ~ /^Experiment [0-9]+-[0-9]+/ || probe ~ /^Lesson [0-9]+:/) {
          page_kind = "structured"
        }
      }
    }

    function emit_page_notes() {
      if (page_kind == "list") {
        print "> [!note]"
        print "> This page is a structured list. OCR is useful for navigation, but page numbers and titles should be confirmed against the image if cited exactly."
        print ""
      } else if (page_kind == "structured") {
        print "> [!note]"
        print "> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters."
        print ""
      }
    }

    function flush_page() {
      if (!in_page) {
        return
      }

      scan_insert_lines = 0
      manual_lines = 0
      suppress_page = 0
      last_nonempty = ""
      for (i = 1; i <= line_count; i++) {
        raw = page_lines[i]
        line = trim(raw)
        if (line == "") {
          continue
        }
        if (line == "OUT OF PRINT" ||
            line == "HEWLETT PACKARD MANUAL SCANS" ||
            line == "“High resolution scans of obsolete technical manuals”" ||
            line == "ALL HEWLETT PACKARD MANAULS ARE REPRODUCED BY PERMISSION") {
          suppress_page = 1
        }
        if (is_scan_insert(line)) {
          scan_insert_lines++
          continue
        }
        manual_lines++
        last_nonempty = line
      }

      if (suppress_page || (scan_insert_lines > 0 && manual_lines == 0)) {
        print "[non-manual scan-insert content removed]"
        print ""
        line_count = 0
        blank_count = 0
        return
      }

      detect_page_kind()
      emit_page_notes()

      for (i = 1; i <= line_count; i++) {
        raw = page_lines[i]
        line = trim(raw)

        if (line == "") {
          blank_count++
          if (blank_count <= 2) {
            print ""
          }
          continue
        }

        blank_count = 0

        if (is_scan_insert(line)) {
          continue
        }
        gsub(/[[:space:]]*Scans by[^[:cntrl:]]*$/, "", raw)
        gsub(/[[:space:]]*=>[[:space:]]*2012[[:space:]]*$/, "", raw)
        if (tolower(raw) ~ /artek/ || raw ~ /=> *2012/) {
          continue
        }
        if (line == "“High resolution scans of obsolete technical manuals”") {
          continue
        }
        if (line == "ALL HEWLETT PACKARD MANAULS ARE REPRODUCED BY PERMISSION") {
          continue
        }
        if (line ~ /^[ivxlcdm]+$/) {
          continue
        }
        if (line == "Practical Microprocessors") {
          continue
        }
        if (line == "List of Figures" || line == "Table of Contents") {
          continue
        }

        print rtrim(raw)
      }

      print ""
      line_count = 0
      blank_count = 0
    }

    /^## Page [0-9]+$/ {
      flush_page()
      in_page = 1
      print $0
      print ""
      next
    }

    {
      page_lines[++line_count] = $0
    }

    END {
      flush_page()
    }
  ' "$1" > "$2"
}

render_page_images() {
  local src="$1"
  local out_dir="$2"
  local dpi="${3:-135}"

  mkdir -p "$out_dir"
  if [[ -n "$PAGE_START" && -n "$PAGE_END" ]]; then
    pdftoppm -f "$PAGE_START" -l "$PAGE_END" -r "$dpi" -png "$src" "$out_dir/page" >/dev/null 2>&1
  else
    pdftoppm -r "$dpi" -png "$src" "$out_dir/page" >/dev/null 2>&1
  fi
}

scrub_page_images() {
  local figures_dir="$1"
  local image
  local top_band=90
  local bottom_band=90

  find "$figures_dir" -maxdepth 1 -type f -name 'page-*.png' ! -name 'page-002.png' | while read -r image; do
    magick "$image" \
      -fill white \
      -draw "rectangle 0,0 99999,${top_band}" \
      -draw "rectangle 0,%[fx:h-${bottom_band}] 99999,99999" \
      "$image"
  done

  rm -f "$figures_dir/page-002.png"
}

write_text_with_page_markers() {
  local src="$1"
  local out="$2"
  local pdftotext_args=(-layout "$src" -)

  if [[ -n "$PAGE_START" && -n "$PAGE_END" ]]; then
    pdftotext_args=(-f "$PAGE_START" -l "$PAGE_END" -layout "$src" -)
  fi

  pdftotext "${pdftotext_args[@]}" \
    | awk -v start_page="${PAGE_START:-1}" '
      BEGIN {
        page = start_page
        print "## Page " page
        print ""
      }
      {
        gsub(/\r/, "")
        while (index($0, "\f")) {
          sub(/\f/, "")
          if (length($0) > 0) {
            print $0
          }
          print ""
          page++
          print "## Page " page
          print ""
          next_line = 1
        }
        if (!next_line) {
          print $0
        }
        next_line = 0
      }
    ' > "$out"
}

drop_placeholder_pages() {
  local src="$1"
  local tmp="$TMP_DIR/without-placeholder-pages.md"

  awk '
    function flush_page() {
      local_nonempty = 0
      placeholder_only = 0

      if (!have_page) {
        return
      }

      for (i = 1; i <= page_line_count; i++) {
        line = page_lines[i]
        if (line == "") {
          continue
        }
        local_nonempty++
        if (line == "[non-manual scan-insert content removed]") {
          placeholder_only++
        }
      }

      if (local_nonempty == 1 && placeholder_only == 1) {
        have_page = 0
        page_line_count = 0
        delete page_lines
        return
      }

      print page_header
      print ""
      for (i = 1; i <= page_line_count; i++) {
        print page_lines[i]
      }

      have_page = 0
      page_line_count = 0
      delete page_lines
    }

    /^## Page [0-9]+$/ {
      flush_page()
      have_page = 1
      page_header = $0
      next
    }

    {
      if (!have_page) {
        print
        next
      }
      page_lines[++page_line_count] = $0
    }

    END {
      flush_page()
    }
  ' "$src" > "$tmp"

  mv "$tmp" "$src"
}

write_practical_microprocessors_index_block() {
  local index="$1"

  if rg -q "^### Practical Microprocessors$" "$index"; then
    return
  fi

  python3 - "$index" <<'PY'
from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text()

insert_after = "- Agent quality note: `docs-classified/service/05036-90001-agent-quality-note.md`\n"
block = """

### Practical Microprocessors

- File: `docs-classified/reference/practical-microprocessors.md`
- Source PDF: `docs/Practical Microprocessors.pdf`
- Category: `microprocessor-lab-handbook`
- Best for: conceptual grounding, 8085 programming, experiment walkthroughs, hardware theory, memory and I/O design, timing interpretation, and troubleshooting technique training
- Fault domains:
  - understanding why a bus, decoder, RAM, ROM, or peripheral fault would produce a symptom
  - explaining monitor behavior, control flow, or timing during diagnosis
  - training an agent to reason about probe, pulser, current tracer, and signature-analyzer workflows
  - mapping a user symptom to likely subsystems before using the service manual for final isolation
- High-value sections:
  - `Section III`: system hardware, buses, addressing, memories, peripherals
  - `Section IV`: interfaces, timing, demultiplexing, interrupts, single-step, buffering
  - `Section V`: programming patterns used on the lab
  - `Section VI`: troubleshooting techniques, logic probe/pulser/current tracer, signature analysis
- Figures: `docs-classified/reference/practical-microprocessors/figures/`
""".lstrip("\n")

usage_anchor = "## Agent Usage Rules\n\n"
usage_addition = (
    "- Use `Practical Microprocessors` first when the user needs explanation, lab pedagogy, or subsystem reasoning rather than immediate repair steps.\n"
    "- Use `Practical Microprocessors` `Section VI` to interpret logic-probe, pulser, current-tracer, and signature-analysis techniques before applying them to the service manual.\n"
    "- Use the handbook for rationale and the service manual for authoritative `5036A` switch settings, signatures, and part-level service flow.\n"
)

if insert_after not in text:
    raise SystemExit("expected service-manual anchor not found in index")

text = text.replace(insert_after, insert_after + block, 1)
text = text.replace(usage_anchor, usage_anchor + usage_addition, 1)
path.write_text(text)
PY
}

SRC="$DOCS_DIR/Practical Microprocessors.pdf"
OUT="$OUT_DIR/reference/${OUTPUT_NAME}.md"
RAW_TEXT="$TMP_DIR/practical-raw-text.txt"
CLEANED_TEXT="$TMP_DIR/practical-cleaned-text.txt"
FIGURES_DIR="${OUT%.md}/figures"
RAW_OCR_OUT="$OCR_DIR/${OUTPUT_NAME}.raw-ocr.txt"
CLEANED_OCR_OUT="$OCR_DIR/${OUTPUT_NAME}.cleaned-ocr.txt"
TOTAL_PAGES="$(pdfinfo "$SRC" | awk -F': *' '/^Pages:/ {print $2}')"

if [[ -n "$PAGE_START" && -n "$PAGE_END" ]]; then
  PAGES="${PAGE_START}-${PAGE_END} of ${TOTAL_PAGES}"
else
  PAGES="$TOTAL_PAGES"
fi

mkdir -p "$(dirname "$OUT")"
mkdir -p "$OCR_DIR"

{
  printf '# Practical Microprocessors\n\n'
  printf -- '- Source PDF: `%s`\n' "${SRC#$ROOT_DIR/}"
  printf -- '- Category: `microprocessor-lab-handbook`\n'
  printf -- '- Printed: `March 1979`\n'
  printf -- '- Pages: `%s`\n' "$PAGES"
  printf -- '- Conversion: `pdftotext` with page markers\n'
  printf -- '- Figures: `%s`\n' "${FIGURES_DIR#$ROOT_DIR/}"
  printf -- '- Diagnostic Scope: `Reference and teaching handbook for the HP 5036A uLab / Microprocessor Lab, covering fundamentals, 8085 programming, lab experiments, hardware, interfacing, logic-probe troubleshooting, and signature analysis.`\n'
  printf -- '- Notes: `The file name says Practical Microprocessors, and the scanned text confirms it is the 1979 Hewlett-Packard handbook by Michael Slater and Barry Bronson. OCR is usable for search but figure-heavy and lab-diagram pages still need image verification.`\n\n'
  printf '## Agent Notes\n\n'
  printf 'Use this handbook for explanation, training, experiment context, programming examples, and subsystem reasoning. Use the service manual when the task is part replacement, formal troubleshooting flow, or exact service signatures.\n\n'
  printf '## Recommended Use\n\n'
  printf -- '- Reach for this document first when the user needs conceptual background: bus behavior, memory mapping, addressing, timing, I/O, peripherals, interrupts, or 8085 programming patterns.\n'
  printf -- '- Reach for the service manual first when the user is diagnosing a live hardware fault and needs official test setup, switch positions, chip-level service references, or repair workflow.\n'
  printf -- '- Use this handbook as the interpretation layer behind the service manual when a symptom needs architectural explanation.\n\n'
  printf '## High-Value Navigation\n\n'
  printf -- '- `Table of Contents` begins at `## Page 5`\n'
  printf -- '- `Section I: Microprocessor Fundamentals` begins near `## Page 9`\n'
  printf -- '- `Section II: Introduction to Programming` begins near `## Page 16`\n'
  printf -- '- `Section III: Microprocessor System Hardware` begins near `## Page 24`\n'
  printf -- '- `Section IV: Microprocessor Systems` begins near `## Page 34`\n'
  printf -- '- `Section V: Microcomputer Programming` begins near `## Page 56`\n'
  printf -- '- `Section VI: Troubleshooting Techniques` begins near `## Page 66`\n'
  printf -- '- `Lesson 16`: logic probe, logic pulser, and current tracer troubleshooting\n'
  printf -- '- `Lesson 17`: signature analysis and fault-isolation workflow\n\n'
  printf '## Trust Notes\n\n'
  printf -- '- Repeated scan-insert pages and footer clutter were removed where possible.\n'
  printf -- '- OCR is strong enough for lesson discovery and concept lookup, but formulas, figures, code listings, and tabular values should be checked against the matching page image when quoted or used diagnostically.\n'
  printf -- '- Use the service-manual verified companion and structured signature tables for exact `5036A` service signatures; this handbook is better for understanding why those signatures matter.\n\n'
  printf '## Extracted Text\n\n'
} > "$OUT"

write_text_with_page_markers "$SRC" "$RAW_TEXT"
normalize_manual_text "$RAW_TEXT" "$CLEANED_TEXT"
cp "$RAW_TEXT" "$RAW_OCR_OUT"
cp "$CLEANED_TEXT" "$CLEANED_OCR_OUT"
cat "$CLEANED_TEXT" >> "$OUT"
drop_placeholder_pages "$OUT"
if [[ "$SKIP_IMAGES" == "1" ]]; then
  :
else
  render_page_images "$SRC" "$FIGURES_DIR" 135
  scrub_page_images "$FIGURES_DIR"
fi
if [[ "$OUTPUT_NAME" == "practical-microprocessors" ]]; then
  write_practical_microprocessors_index_block "$OUT_DIR/index.md"
fi

printf 'Wrote handbook classification to %s\n' "$OUT"
