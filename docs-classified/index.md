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
- Use the agent quality note to choose the trust level before giving a part-level diagnosis.
