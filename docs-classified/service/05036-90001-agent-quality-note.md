# HP 5036A Agent Quality Note

This note defines how a diagnostic agent should use the classified HP `5036A` service content safely.

## Primary Rule

Use the highest-trust source that answers the question. Do not treat all Markdown in `docs-classified/service/` as equally reliable.

## Trust Order

1. Page images in [05036-90001/figures](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp5036a/docs-classified/service/05036-90001/figures)
2. [05036-90001-verified-pages-60-73.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp5036a/docs-classified/service/05036-90001-verified-pages-60-73.md)
3. Structured signature tables in [signature-tables](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp5036a/docs-classified/service/signature-tables)
4. Raw OCR manual [05036-90001.md](/home/cartheur/ame/aiventure/aiventure-github/cartheur/hp5036a/docs-classified/service/05036-90001.md)

## Safe Usage

- Use the verified companion for manual pages `7-14` through `7-27`.
- Use the structured signature tables for chip/pin lookup during `Table 7-1` through `Table 7-4` diagnostics.
- Use the raw OCR manual for workflow, section discovery, and broad theory-of-operation context.
- Use the page images whenever a signature token, chip designator, jumper name, or switch position is decision-critical.

## Known Risks

- The raw OCR manual still contains recognition errors such as merged fields, wrong device labels, and occasional bad character substitutions.
- Some signature tokens remain visually ambiguous even in the verified/structured material because the original scan is dense and uses similar glyphs like `0/O`, `1/I`, `5/S`, and `U/V`.
- Foldout schematic and board-trace pages are not trustworthy from OCR alone and should be used directly from the images.

## Diagnostic Behavior Rules

- Do not recommend replacing hardware from a single low-trust OCR reading.
- If a symptom depends on one exact signature value, confirm it against the page image before drawing a conclusion.
- If the raw OCR conflicts with the verified companion or structured tables, prefer the verified companion or page image.
- If the structured table conflicts with the page image, treat the page image as authoritative.
- Treat the training fault jumpers as a live possibility before concluding that an IC has failed.

## Recommended Workflow

1. Start with the symptom and identify the relevant test mode or subsystem.
2. Use `Section VII` for troubleshooting flow and test setup.
3. Use the verified companion and structured tables for signature-driven isolation.
4. Fall back to `Section III` for architectural reasoning.
5. Re-check the page image before any final part-level diagnosis.

## Output Expectations

When answering a diagnostic question from this corpus:

- name the source used
- state the confidence level
- call out any ambiguity explicitly
- mention when the conclusion depends on image verification

## Suggested Confidence Labels

- `high`: verified companion plus matching page image, or direct image read
- `medium`: structured table consistent with verified setup/context
- `low`: raw OCR only, or unresolved token ambiguity
