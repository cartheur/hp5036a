#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DOCS_DIR="$ROOT_DIR/docs"
OUT_DIR="$ROOT_DIR/docs-classified"
TMP_DIR="$(mktemp -d)"
OCR_JOBS="${OCR_JOBS:-4}"
trap 'rm -rf "$TMP_DIR"' EXIT

render_page_images() {
  local src="$1"
  local out_dir="$2"
  local dpi="${3:-170}"

  mkdir -p "$out_dir"
  pdftoppm -r "$dpi" -png "$src" "$out_dir/page" >/dev/null 2>&1
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
    printf '## Extracted Text\n\n'
  } > "$out"

  pdftotext "$src" - \
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
    ' >> "$out"

  render_page_images "$src" "$figures_dir" 170
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

## Agent Usage Rules

- Start with `Section VII` when the user is diagnosing an existing hardware fault.
- Switch to `Section III` when the symptom needs architectural interpretation: address decode, control flow, RAM/ROM access, interrupts, reset, or display/keyboard logic.
- Use `Section IV` to distinguish an actual failure from an unmet verification precondition.
- Treat the built-in fault jumpers as a first-class possibility before concluding a device has failed.
- When OCR text is ambiguous, cite the page number from the Markdown and inspect the matching image in `docs-classified/service/05036-90001/figures/`.
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
  "The PDF already contains OCR text, so `pdftotext` is sufficient for search. Rendered page images should still be used for schematics, tables, jumper layouts, and any suspicious OCR."

write_index

printf 'Wrote classified docs to %s\n' "$OUT_DIR"
