## hp5036a

Suitcase-based microprocessor lab

![5036a](/images/hp5036a-half.jpg)

### Background

The HP 5036A Microprocessor Lab is a particularly interesting late-1970s machine because it was not primarily intended to teach programming. Hewlett-Packard designed it to teach engineers and technicians how a microprocessor system actually works electrically—and how to diagnose one when it fails. HP introduced it in 1979, during the transition when many electronics engineers were moving from analog and discrete/TTL logic into microprocessor-based equipment. HP describes it as a self-education system: a single-board computer in a briefcase, accompanied by a substantial coursebook.

| Component               | HP 5036A                               |
| ----------------------- | -------------------------------------- |
| CPU                     | Intel 8085A                            |
| Clock                   | 2 MHz crystal-controlled               |
| RAM                     | **1 KB**                               |
| ROM                     | **2 KB**                               |
| User interface          | 26-key keypad                          |
| Display                 | 6 × 7-segment LEDs                     |
| Output                  | 8-bit latched port + 8 LEDs            |
| Input                   | 8-bit input port + switches            |
| Bus monitoring          | LEDs on address, data and status lines |
| Expansion               | Address/data bus edge connectors       |
| Audio                   | Software-controlled speaker            |
| Programming environment | Hexadecimal monitor                    |

The contemporary HP specification confirms the 2 MHz clock and also shows that the case contained dual 5 V supplies, with power available for external experimental circuitry. But those specifications don't really explain why the 5036A is interesting.

_It's essentially a transparent computer_

HP deliberately made the internal architecture visible. Look at the PCB and you'll notice the enormous blue signal paths marked ADDRESS BUS and DATA BUS, functional blocks identified directly on the board, and LEDs scattered around the circuitry.

That was pedagogical. Instead of:

`CPU → invisible motherboard activity → screen`

you effectively had:

`8085 → address bus → decoder → ROM/RAM → data bus → I/O`

sitting in front of you.

The LEDs allowed the student to observe address, data, status and output signals while executing programs. HP explicitly says the LEDs were intended to let students see the computer operating. This makes the 5036A conceptually much closer to machines such as the KIM-1, SDK-85 and Heathkit ET-3400 than to a contemporary personal computer. But HP put considerably more emphasis on instrumentation and troubleshooting.

_The really clever feature: deliberately breaking the computer_

This is probably the most interesting aspect of the 5036A. HP incorporated 12 movable fault jumpers into the board. You could deliberately introduce hardware faults and then diagnose them. For example, the training system could teach you to reason through failures involving the data bus, address circuitry, memory or associated logic rather than simply telling you that "RAM failed." The accompanying material provided troubleshooting trees, schematics, block diagrams, expected signatures and solutions for the twelve fault configurations. Consequently the educational cycle was essentially:

`understand architecture → write/run program → introduce fault → observe symptoms → measure signals → isolate defective functional block`

That's much closer to laboratory electronics training than modern software-oriented microcontroller education.

### Signature analysis

This connects the 5036A with another important piece of HP history: signature analysis. HP was promoting instruments such as the 5004A Signature Analyzer for troubleshooting complex digital systems. Instead of trying to interpret an oscilloscope trace containing a complicated stream of digital transitions, the analyzer converted the signal observed at a test point into a compact hexadecimal-like "signature."

The service documentation could therefore specify expected signatures at nodes.

If:

`expected = XXXX`

but:

`measured = YYYY`

you could work backward through the circuit until locating the faulty logic. HP specifically recommended the 5004A and its 5024A troubleshooting kit for experiments with the 5036A.

![5004a](/images/hp5004a.jpg)

So the 5036A wasn't merely a CPU trainer. It was effectively a training platform for HP's philosophy of structured digital-system diagnosis.

_The book was arguably half the product_

The accompanying textbook was Practical Microprocessors: Hardware, Software, and Troubleshooting, principally associated with Michael Slater and Barry Bronson. It was roughly 450 pages and organized as about 20 lessons, culminating in practical troubleshooting exercises involving handheld tools, logic/signature analyzers, microprocessor systems and finally the 5036A itself. HP described the course as self-instructional.

This is why a complete 5036A with its original book is much more historically interesting than a bare PCB.
