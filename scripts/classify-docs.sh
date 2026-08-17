#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DOCS_DIR="$ROOT_DIR/docs"
OUT_DIR="$ROOT_DIR/docs-classified"
TMP_DIR="$(mktemp -d)"
OCR_JOBS="${OCR_JOBS:-4}"
trap 'rm -rf "$TMP_DIR"' EXIT

normalize_manual_text() {
  awk '
    function trim(s) {
      sub(/^[[:space:]]+/, "", s)
      sub(/[[:space:]]+$/, "", s)
      return s
    }

    function ltrim(s) {
      sub(/^[[:space:]]+/, "", s)
      return s
    }

    function rtrim(s) {
      sub(/[[:space:]]+$/, "", s)
      return s
    }

    function is_scan_insert(line) {
      if (line ~ /^Scans by Artek[Mm]edia => 2012$/) return 1
      if (line ~ /^Artek ?Media$/) return 1
      if (line ~ /^ArtekMedia$/) return 1
      if (line ~ /ArtekMedia/) return 1
      if (line ~ /^www\.artekmedia\.com$/) return 1
      if (line ~ /^manuals@/) return 1
      if (line ~ /manuals@ArtekMedia\.com/) return 1
      if (line ~ /^Digitally signed by ArtekMedia$/) return 1
      if (line ~ /^DN: cn=ArtekMedia/) return 1
      if (line ~ /^Date: 2012\./) return 1
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
        if (probe ~ /^Table 7-[1-4]\./) {
          page_kind = "signature-table"
          return
        }
        if (probe ~ /^3-89\./ || probe == "5036A KEYBOARD") {
          page_kind = "keyboard-map"
        } else if (probe ~ /^3-91\./ || probe == "LOGIC SYMBOLS") {
          page_kind = "logic-symbols"
        } else if (probe ~ /^Figure 7-3\./ || probe ~ /^Figure 7-5\./) {
          page_kind = "figure-heavy"
        }
      }
    }

    function emit_page_notes() {
      if (page_kind == "signature-table") {
        print "> [!warning]"
        print "> OCR confidence is low on this signature table. Do not treat the values below as canonical without checking the matching page image in `figures/`."
        print "> Safe use: use this block to locate chip designators and workflow structure, then verify actual signatures visually."
        print ""
      } else if (page_kind == "keyboard-map") {
        print "> [!note]"
        print "> This page preserves layout because control names matter. OCR is medium confidence: use the curated keyboard legend above first, and verify exact legends against the page image before quoting them."
        print ""
      } else if (page_kind == "logic-symbols" || page_kind == "figure-heavy") {
        print "> [!note]"
        print "> This is structured scan content. Layout is preserved, but symbol pinouts and figure labels should be verified against the page image when used for diagnostics."
        print ""
      }
    }

    function flush_page() {
      if (!in_page) {
        return
      }

      page_type = ""
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
        if (line ~ /^SECTION [IVX]+$/) {
          page_type = "section"
          break
        }
        if (line == "TABLE OF CONTENTS") {
          page_type = "toc"
        }
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

      if (page_kind != "plain") {
        print "```text"
      }

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

        if (line ~ /^Scans by Artek[Mm]edia => 2012$/) {
          continue
        }
        if (line == "DIGITALY REMASTERED") {
          continue
        }
        if (line ~ /^OUT OF PRINT$/) {
          continue
        }
        if (line ~ /^HEWLETT PACKARD MANUAL SCANS$/) {
          continue
        }
        if (line ~ /^Artek ?Media$/) {
          continue
        }
        if (line ~ /^Artek[Mm]edia$/) {
          continue
        }
        if (line ~ /Artek[Mm]edia/) {
          continue
        }
        if (line ~ /^www\.artekmedia\.com$/) {
          continue
        }
        if (line ~ /^manuals@/) {
          continue
        }
        if (line ~ /manuals@Artek[Mm]edia\.com/) {
          continue
        }
        if (line ~ /^Digitally signed by Artek[Mm]edia$/) {
          continue
        }
        if (line ~ /^DN: cn=Artek[Mm]edia/) {
          continue
        }
        if (line ~ /^Date: 2012\./) {
          continue
        }
        if (line == "SCANS") {
          continue
        }
        if (line == "By") {
          next_line = ""
          for (j = i + 1; j <= line_count; j++) {
            next_line = trim(page_lines[j])
            if (next_line != "") {
              break
            }
          }
          if (next_line ~ /^Artek/) {
            continue
          }
        }
        if (line == "Model5036A" || line == "ModelS036A") {
          continue
        }
        if (line == "Table of Contents" && page_type == "toc") {
          continue
        }
        if (line ~ /^[ivxlcdm]+$/) {
          continue
        }
        if (line ~ /^[0-9]+-[0-9]+$/) {
          continue
        }
        if (line == "•") {
          continue
        }
        if (line ~ /^SECTION [IVX]+$/) {
          next_title = ""
          for (j = i + 1; j <= line_count; j++) {
            next_title = trim(page_lines[j])
            if (next_title != "") {
              break
            }
          }
          if (next_title != "") {
            print "### " line " - " next_title
            print ""
            i = j
            continue
          }
        }

        print rtrim(raw)
      }

      if (page_kind != "plain") {
        print "```"
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
  local dpi="${3:-170}"

  mkdir -p "$out_dir"
  pdftoppm -r "$dpi" -png "$src" "$out_dir/page" >/dev/null 2>&1
}

scrub_service_page_images() {
  local figures_dir="$1"
  local image

  find "$figures_dir" -maxdepth 1 -type f -name 'page-*.png' ! -name 'page-02.png' | while read -r image; do
    magick "$image" \
      -fill white \
      -draw "rectangle %[fx:w*0.28],0 %[fx:w*0.72],90" \
      -draw "rectangle %[fx:w*0.28],%[fx:h-120] %[fx:w*0.72],%[fx:h]" \
      "$image"
  done

  rm -f "$figures_dir/page-02.png"
}

compact_service_page_sequence() {
  local figures_dir="$1"
  local page
  local old
  local new

  for page in $(seq 3 73); do
    printf -v old '%s/page-%02d.png' "$figures_dir" "$page"
    printf -v new '%s/page-%02d.png' "$figures_dir" "$((page - 1))"
    if [[ -f "$old" ]]; then
      mv "$old" "$new"
    fi
  done
}

render_text_pdf() {
  local src="$1"
  local out="$2"
  local title="$3"
  local category="$4"
  local printed="$5"
  local diag_scope="$6"
  local notes="$7"
  local pages
  local figures_dir
  local raw_text="$TMP_DIR/raw-text.txt"
  local cleaned_text="$TMP_DIR/cleaned-text.txt"

  mkdir -p "$(dirname "$out")"
  pages="$(pdfinfo "$src" | awk -F': *' '/^Pages:/ {print $2}')"
  figures_dir="${out%.md}/figures"

  {
    printf '# %s\n\n' "$title"
    printf -- '- Source PDF: `%s`\n' "${src#$ROOT_DIR/}"
    printf -- '- Category: `%s`\n' "$category"
    printf -- '- Printed: `%s`\n' "$printed"
    printf -- '- Pages: `%s`\n' "$pages"
    printf -- '- Conversion: `pdftotext` with page markers\n'
    printf -- '- Figures: `%s`\n' "${figures_dir#$ROOT_DIR/}"
    printf -- '- Diagnostic Scope: %s\n' "$diag_scope"
    printf -- '- Notes: %s\n\n' "$notes"
    printf '## Agent Notes\n\n'
    printf 'Use this Markdown for search, quoting, and service reasoning. Use the rendered page images when the original figure, waveform, or layout matters more than the OCR text.\n\n'
    printf '## Trusted Working Notes\n\n'
    printf 'These notes are curated for agent use and should be preferred over raw OCR when they cover the same material.\n\n'
    printf '### Verified Companion\n\n'
    printf -- '- Verified backmatter companion: `docs-classified/service/05036-90001-verified-pages-60-73.md`\n'
    printf -- '- Use that companion first for manual pages `7-14` through `7-27` (`## Page 60` through `## Page 73` here), especially for signature tables and late-service figures.\n\n'
    printf '### Keyboard Controls\n\n'
    printf '| Control | Intended Meaning |\n'
    printf '| --- | --- |\n'
    printf '| `RUN` | Initiates a program. |\n'
    printf '| `STEP` | Hardware step; advances one machine cycle at a time. |\n'
    printf '| `INSTR STEP` | Advances one full instruction at a time. |\n'
    printf '| `RESET` | Resets the lab or stops a running program. |\n'
    printf '| `INTRPT` | Triggers a user-defined hardware interrupt. |\n'
    printf '| `STORE/INCR` | Stores data and advances the address or register selection. |\n'
    printf '| `DECREMENT` | Decrements the current address. |\n'
    printf '| `FETCH ADRS` | Fetches an address and displays its contents. |\n'
    printf '| `FETCH REG` | Displays register contents; repeated store/increment cycles through 8085 registers. |\n'
    printf '| `FETCH PC` | Displays the program counter. |\n\n'
    printf '### Signature Table Policy\n\n'
    printf -- '- `Tables 7-1` through `7-4` are diagnostically important but OCR-fragile.\n'
    printf -- '- Use the Markdown text for table discovery, chip grouping, and workflow context.\n'
    printf -- '- Use the matching page image as the source of truth for actual signature values before diagnosing a fault or sharing a signature reference.\n\n'
    printf '## Diagnostic Navigation\n\n'
    printf -- '- `Section I` (`## Page 9`): identity, safety, specifications, supplied equipment, recommended tools\n'
    printf -- '- `Section II` (`## Page 16`): installation, line voltage, setup, storage and shipment\n'
    printf -- '- `Section III` (`## Page 20`): theory of operation, buses, decode logic, RAM/ROM, timing, keyboard/display, peripherals\n'
    printf -- '- `Section IV` (`## Page 42`): performance tests\n'
    printf -- '- `Section V` (`## Page 44`): replaceable parts\n'
    printf -- '- `Section VI` (`## Page 61`): manual changes\n'
    printf -- '- `Section VII` (`## Page 62`): service, disassembly, troubleshooting flow, test modes, signature analysis, schematic references\n'
    printf -- '- `Figure 7-2 Troubleshooting Flowchart` (`## Page 66`)\n'
    printf -- '- `Figure 7-3 Test Switches and Connection Points` (`## Page 68`)\n'
    printf -- '- `Figure 7-4 Typical Test Setup` (`## Page 69`)\n'
    printf -- '- `Figure 7-5 5036A Schematic Diagram`: use the sibling figure images when OCR is weak or the schematic text is fragmented\n\n'
    printf '## Cleanup Notes\n\n'
    printf 'Repeated scan footers, page headers, and standalone printed page numbers were removed to reduce OCR clutter. Original page boundaries are preserved with `## Page N` markers for citation and image lookup.\n\n'
    printf '## Extracted Text\n\n'
  } > "$out"

  pdftotext -layout "$src" - \
    | awk '
      BEGIN {
        page = 1
        print "## Page 1"
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
    ' > "$raw_text"

  normalize_manual_text "$raw_text" "$cleaned_text"
  cat "$cleaned_text" >> "$out"

  render_page_images "$src" "$figures_dir" 170
  scrub_service_page_images "$figures_dir"
  compact_service_page_sequence "$figures_dir"
}

render_ocr_pdf() {
  local src="$1"
  local out="$2"
  local title="$3"
  local category="$4"
  local printed="$5"
  local diag_scope="$6"
  local notes="$7"
  local pages
  local figures_dir
  local ocr_dir="$TMP_DIR/ocr-text"
  local image
  local page_id
  local page_num
  local text_file

  mkdir -p "$(dirname "$out")"
  pages="$(pdfinfo "$src" | awk -F': *' '/^Pages:/ {print $2}')"
  figures_dir="${out%.md}/figures"
  mkdir -p "$ocr_dir"

  {
    printf '# %s\n\n' "$title"
    printf -- '- Source PDF: `%s`\n' "${src#$ROOT_DIR/}"
    printf -- '- Category: `%s`\n' "$category"
    printf -- '- Printed: `%s`\n' "$printed"
    printf -- '- Pages: `%s`\n' "$pages"
    printf -- '- Conversion: `pdftoppm` + `tesseract` OCR with per-page markers\n'
    printf -- '- Figures: `%s`\n' "${figures_dir#$ROOT_DIR/}"
    printf -- '- Diagnostic Scope: %s\n' "$diag_scope"
    printf -- '- Notes: %s\n\n' "$notes"
    printf '## Agent Notes\n\n'
    printf 'This document is image-based. OCR spelling noise is expected, so verify thresholds, part numbers, locator references, and waveform values against the rendered page images when the text looks suspicious.\n\n'
    printf '## Extracted Text\n\n'
  } > "$out"

  render_page_images "$src" "$figures_dir" 150

  for image in "$figures_dir"/page-*.png; do
    (
      page_id="$(basename "$image" .png | sed 's/^page-//')"
      tesseract "$image" stdout --psm 6 2>/dev/null > "$ocr_dir/$page_id.txt"
    ) &
    if (( $(jobs -r | wc -l) >= OCR_JOBS )); then
      wait -n
    fi
  done
  wait

  for text_file in "$ocr_dir"/[0-9][0-9][0-9].txt; do
    page_id="$(basename "$text_file" .txt)"
    page_num=$((10#$page_id))
    printf '## Page %s\n\n' "$page_num" >> "$out"
    cat "$text_file" >> "$out"
    printf '\n\n' >> "$out"
  done
}

write_index() {
  mkdir -p "$OUT_DIR"
  cat > "$OUT_DIR/index.md" <<'EOF'
# HP 5036A Document Classification Index

This folder is organized so an agent can diagnose HP 5036A faults without reopening the raw service manual for every question. The emphasis is on board-level reasoning, expected behavior, performance verification, signature analysis, and the lab's deliberate fault-jumper exercises.

## Document Registry

### HP 5036A Microprocessor Lab Service Manual

- File: `docs-classified/service/05036-90001.md`
- Source PDF: `docs/05036-90001.pdf`
- Category: `microprocessor-lab-service-manual`
- Best for: architecture, power-up expectations, bus behavior, keyboard/display logic, memory map reasoning, performance tests, teardown, troubleshooting, and signature-analysis-guided repair
- Fault domains:
  - no power, unstable power, or supply-related malfunction
  - dead CPU activity, stuck address/data lines, or broken timing/control signals
  - ROM, RAM, or decode faults
  - keypad, display, speaker, or control-port anomalies
  - unclear behavior caused by the training fault jumpers rather than defective hardware
  - signature mismatch troubleshooting using HP 5004A procedures and tables
- High-value sections:
  - `Section III`: theory of operation, buses, timing, reset, status, peripherals, keyboard/display
  - `Section IV`: performance tests and expected verification flow
  - `Section VII`: disassembly, troubleshooting procedure, test modes, signature tables, abbreviated troubleshooting
- Figures: `docs-classified/service/05036-90001/figures/`
- Verified companion: `docs-classified/service/05036-90001-verified-pages-60-73.md`
- Agent quality note: `docs-classified/service/05036-90001-agent-quality-note.md`

## Agent Usage Rules

- Start with `Section VII` when the user is diagnosing an existing hardware fault.
- Switch to `Section III` when the symptom needs architectural interpretation: address decode, control flow, RAM/ROM access, interrupts, reset, or display/keyboard logic.
- Use `Section IV` to distinguish an actual failure from an unmet verification precondition.
- Treat the built-in fault jumpers as a first-class possibility before concluding a device has failed.
- When OCR text is ambiguous, cite the page number from the Markdown and inspect the matching image in `docs-classified/service/05036-90001/figures/`.
- For manual pages `7-14` through `7-27`, start with the verified companion before consulting the raw OCR block.
- For signature-analysis questions, prefer the `Section VII` signature tables and associated test-mode procedures over free-form reasoning.
EOF
}

mkdir -p \
  "$OUT_DIR/service"

render_text_pdf \
  "$DOCS_DIR/05036-90001.pdf" \
  "$OUT_DIR/service/05036-90001.md" \
  "HP 5036A Microprocessor Lab Service Manual" \
  "microprocessor-lab-service-manual" \
  "February 1979" \
  "Primary source for 5036A fault diagnosis, circuit understanding, performance verification, signature analysis, and service disassembly." \
  'The PDF already contains OCR text, so `pdftotext` is sufficient for search. Rendered page images should still be used for schematics, tables, jumper layouts, and any suspicious OCR.'

write_index

printf 'Wrote classified docs to %s\n' "$OUT_DIR"
