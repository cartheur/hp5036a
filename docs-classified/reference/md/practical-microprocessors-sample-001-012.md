# Practical Microprocessors

- Source PDF: `docs/Practical Microprocessors.pdf`
- Category: `microprocessor-lab-handbook`
- Printed: `March 1979`
- Pages: `1-12 of 484`
- Conversion: `pdftotext` with page markers
- Figures: `docs-classified/reference/practical-microprocessors-sample-001-012/figures`
- Diagnostic Scope: `Reference and teaching handbook for the HP 5036A uLab / Microprocessor Lab, covering fundamentals, 8085 programming, lab experiments, hardware, interfacing, logic-probe troubleshooting, and signature analysis.`
- Notes: `The file name says Practical Microprocessors, and the scanned text confirms it is the 1979 Hewlett-Packard handbook by Michael Slater and Barry Bronson. OCR is usable for search but figure-heavy and lab-diagram pages still need image verification.`

## Agent Notes

Use this handbook for explanation, training, experiment context, programming examples, and subsystem reasoning. Use the service manual when the task is part replacement, formal troubleshooting flow, or exact service signatures.

## Recommended Use

- Reach for this document first when the user needs conceptual background: bus behavior, memory mapping, addressing, timing, I/O, peripherals, interrupts, or 8085 programming patterns.
- Reach for the service manual first when the user is diagnosing a live hardware fault and needs official test setup, switch positions, chip-level service references, or repair workflow.
- Use this handbook as the interpretation layer behind the service manual when a symptom needs architectural explanation.

## High-Value Navigation

- `Table of Contents` begins at `## Page 5`
- `Section I: Microprocessor Fundamentals` begins near `## Page 9`
- `Section II: Introduction to Programming` begins near `## Page 16`
- `Section III: Microprocessor System Hardware` begins near `## Page 24`
- `Section IV: Microprocessor Systems` begins near `## Page 34`
- `Section V: Microcomputer Programming` begins near `## Page 56`
- `Section VI: Troubleshooting Techniques` begins near `## Page 66`
- `Lesson 16`: logic probe, logic pulser, and current tracer troubleshooting
- `Lesson 17`: signature analysis and fault-isolation workflow

## Trust Notes

- Repeated scan-insert pages and footer clutter were removed where possible.
- OCR is strong enough for lesson discovery and concept lookup, but formulas, figures, code listings, and tabular values should be checked against the matching page image when quoted or used diagnostically.
- Use the service-manual verified companion and structured signature tables for exact `5036A` service signatures; this handbook is better for understanding why those signatures matter.

## Extracted Text

## Page 1



     FOR COMPLETE
  APPLICATION & SALES
      INFORMATION
          CAll


 Bernie Halliwell


                               HEWLETT" PACKARD


Hardware, Software, and Troubleshooting


## Page 3




PRACTICAL MICROPROCESSORS
 Hardware, Software, and Troubleshooting


              Michael Slater

               Barry Bronson


             HEWLETT    iii   PACKARD
  First Printing - MARCH 1979


## Page 4



        COPYRIGHT© 1979             I,


              by

HEWLETT-PACKARD COMPANY
5301 STEVENS CREEK BLVD.
SANTA CLARA, CALIF. 95050




## Page 5


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



_ _ _ _~---TABLE OF CONTENTS


        PREFACE                                                                                                                              xix

        I.   MICROPROCESSOR FUNDAMENTALS .................................                                                                    1


              Lesson 1: Introduction to Microprocessor Systems .....................                                                          3
                Introduction ... . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .      3
                The Development of the Microprocessor .............................                                                           3
                Why Microprocessors are Used .....................................                                                            5
                A Basic Microprocessor System .....................................                                                           6
                Programs ..........................................................                                                           8
                Peripherals . . . . . . . . . . . . . . . . . . . . . . .. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .    8
                Three-State Drivers .................................................                                                         9
                The Microprocessor ................................................                                                          11
                Memories ..........................................................                                                          12
                ROMs and RAMs ...................................................                                                            13
                Microcomputers and Minicomputers .................................                                                           16
                Experiment 1-1: Introduction to the Microprocessor Lab ..............                                                        17
                Review ............................................................                                                          19
                Quiz ...............................................................                                                         20


              Lesson 2: Number Systems ...........................................                                                           21
                Introduction ...................................................-. . . .                                                     21
                Decimal and Binary ................................................                                                          21
                Octal ..............................................................                                                         22
                Hexadecimal .......................................................                                                          23
                Bit Position Terminology ...........................................                                                         24
                Review ....... ......................................................                                                        25
                Quiz...............................................................                                                          26


              Lesson 3: Software Fundamentals .....................................                                                          27
                Introduction .......................................................                                                         27
                Computers Don't Think .............................................                                                          27
                The Microcomputer as a Logic Device ...............................                                                          28
                Flowcharts .........................................................                                                         29
                Experiment 3-1: The Microprocessor Lab as an AND Gate ............                                                           31
                Characteristics of the Microprocessor-Based AND Gate ..............                                                          32
                Programming Languages ...........................................                                                            32
                A Programming Example ...........................................                                                            33
                Comparing the Different Types of Languages ........................                                                          37
                Programming the J.tLab .............................................                                                         38
                Experiment 3-2: Interpreting Memory Concepts ......................                                                          39
                An Application Example ............................................                                                          41
                Modifying the Program .............................................                                                          42
                Experiment 3-3: Conveyor Belt Simulator ............................                                                         44
                Review ............................................................                                                          45
                Quiz...............................................................                                                          46


Practical Microprocessors                                                                                                                          iii
TABLE OF CONTENTS _ _ _ _ _ _ __


## Page 6


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


( Continued)

       II.    INTRODUCTION TO PROGRAMMING                                                                                                    47

               Lesson 4: Using the Microprocessor Lab .,. . . . . . . . . . . . . . . . . . . . . . . . . . . .                              49
                 Introduction .......................................................                                                        49
                 The Microprocessor Lab Memory Map ...............................                                                           49
                 Experiment 4-1: Examining Memory and Storing Data ................                                                          51
                 A Simple Program ..................................................                                                         54
                 Experiment 4-2: Executing Programs ................................                                                         55
                 The Input and Output Ports .........................................                                                        59
                 Experiment 4-3: Using the Input and Output Ports ...................                                                        61
                 Review ............................................................                                                         63
                 Quiz...............................................................                                                         64

               Lesson 5: Basic Software Concepts ... . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .                         65
                 Introduction .,. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .    65
                 The Microprocessor's Registers .....................................                                                        65
                 Monitoring Program Flow ...........................................                                                         66
                 The tLLab's Monitor Program ........................................                                                        66
                 A Counter Program .,. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .             67
                 Experiment 5-1: Running the Counter Program ......................                                                          69
                 Program Organization ..............................................                                                         73
                 An Example ........................................................                                                         73
                 Experiment 5-2: Subroutines ........................................                                                        76
                 Interrupts .....................................................-.....                                                      77
                 Using the tLLab's Interrupt Key ......................................                                                      77
                 Experiment 5-3: Interrupts ..........................................                                                       80
                 Review ............................................................                                                         81
                 Quiz...............................................................                                                         82

               Lesson 6: Inside the Microprocessor ..... . . . . . . . . . . . . . . . . . . . . . . . . . . . . .                           83
                 Introduction ., . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .   83
                 Inside the 8085A ...................................................                                                        83
                 The Instruction Cycle ..............................................                                                        84
                 Instruction Execution ...............................................                                                       85
                 Machine Cycles ....................................................                                                         86
                 Program Execution .................................................                                                         86
                 Experiment 6-1: Bus Operation ......................................                                                        88
                 Review ............................................................                                                         91
                 Quiz...............................................................                                                         92

       III.   MICROPROCESSOR SYSTEM HARDWARE.............................                                                                    93

               Lesson 7: Basic Hardware Concepts ...................................                                                         95
                 Introduction ... . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .    95
                 The Bus Concept . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .         95
                 The Three-State Bus ...............................................                                                         96
                 The Data Bus ......................................................                                                         98
                 The Address Bus ...................................................                                                         99
                 Add ress Decoders ..................................................                                                        99


iv                                                                                                              Practical Microprocessors


## Page 7


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



_ _ _ _ _ _ _ _ TABLE OF CONTENTS
                                                                                                                      ( Continued)

                  The Control Bus ...................................................                                            100
                  Output Ports .......................................................                                           100
                  Input Ports .........................................................                                          101
                  Address Decoding for Multiple Devices ..............................                                           101
                  Address Decoding for Memories ....................................                                             102
                  Controlling Multiple Memory Devices ................................                                           102
                  RAM Control .......................................................                                            104
                  Review ............................................................                                            104
                  Quiz ...............................................................                                           105

               Lesson 8: Addressing Decoding .......................................                                             109
                 Introduction .......................................................                                            109
                 Address Structures .................................................                                            109
                 The Microprocessor Lab's Addressing Structure .....................                                             109
                 The Decoding Hardware ............................................                                              111
                 RAM Write Protect Circuit ..........................................                                            112
                 Experiment 8-1: The Address Decoder ...............................                                             114
                 Other Decoding Techniques ........................................                                              119
                 Linear Select Decoding .............................................                                            119
                 Logic Comparator Decoding ........................................                                              119
                 Combinational Logic Decoding .....................................                                              120
                 I/O Mapped Decoding ..............................................                                              121
                 Review ............................................................                                             122
                 Quiz ..........................................................-.....                                           123

               Lesson 9: Memories and Peripherals ... . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ..               125
                 Introduction .......................................................                                            125
                 Memories ..........................................................                                             125
                 RAMs ..............................................................                                             125
                 The Microprocessor Lab's RAM .....................................                                              126
                 Other Memory Configurations ......................................                                              126
                 Read-Only Memories ...............................................                                              127
                 The Microprocessor Lab's ROM .....................................                                              128
                 Microcomputer Peripherals .........................................                                             128
                 Inputs and Outputs .................................................                                            128
                 Keyboard and Display ..............................................                                             129
                 The Serial Output Port ... . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ..   132
                 Experiment 9-1: Program Execution .................................                                             133
                 Peripheral Interface Chips ..........................................                                           139
                 Review ............................................................                                             141
                 Quiz ...............................................................                                            142

               Lesson 10: Control Circuits ...........................................                                           145
                 Introduction .......................................................                                            145
                 The Control Port ...................................................                                            145
                 The Multiplexed Bus ...............................................                                             146
                 The 8085 Family ...................................................                                             148
                 Experiment 10-1: Bus Timing .......................................                                             149
                 Other Control Signals ..............................................                                            153


Practical Microprocessors                                                                                                              v
TABLE OF CONTENTS _ _ _ _ _ _ __


## Page 8


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


(Continued)
              The Single-Step Circuit .............................................    156
              Programmable Timers ..............................................       157
              Electronic Considerations ..........................................     157
              Review ............................................................      162
              Quiz ...............................................................     163

     IV.   MICROPROCESSOR SOFTWARE ...................................... 165

            Lesson 11: Registers and Breakpoints .................................     167
              Introduction .......................................................     167
              Instruction Review .................................................     167
              The Variety of Instructions ..........................................   168
              The General-Purpose Registers .....................................      168
              Indirect Addressing ................................................     169
              Experiment 11-1: Using the Registers ................................    171
              Breakpoints ........................................................     174
              Using Breakpoints ..................................................     174
              Hardware Breakpoints ..............................................      174
              Experiment 11-2: Using Breakpoints .................................     175
              Review ............................................................      177
              Quiz ...............................................................     178

            Lesson 12: The 8085 Instruction Set ...................................    179
              Introduction ......................................................-.    179
              Logical Instructions ................................................    179
              Experiment 12-1: Logical Instructions ...............................    181
              Masking ...........................................................      183
              Programming Exercise 12-1: Masking ...............................       183
              Clearing the Accumulator.. .........................................     184
              Shifting ............................................................    184
              Programming Exercise 12-2: Rotates ................................      185
              Addition ...........................................................     186
              The Carry Flag .....................................................     186
              Subtraction ........................................................     186
              Experiment 12-2: Arithmetic Functions ..............................     188
              Subroutines and the Stack ..........................................     190
              Push and Pop Instructions ..........................................     191
              Review ............................................................      193
              Quiz ...............................................................     194

           Lesson 13: Software Design Techniques ...............................       195
             Introduction .......................................................      195
             Development Systems ..............................................        195
             A Software Design Procedure .......................................       196
             A Software Design Example ........................................        197
             The Sequencing Routine ...........................................        198
             The Change Routine ...............................................        198
             The Delay Routine .................................................       200
             Structure Charts ...................................................      201




## Page 9


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



_ _ _ _ _ _ _ _ TABLE OF CONTENTS
                                                                                                                                 ( Continued)

                  The Controller Programs ...........................................                                                       201
                  Designing the Delay Routine ........................................                                                      203
                  Using Register Pairs ................................................                                                     203
                  Testing Techniques ................................................                                                       205
                  Experiment 13-1: Testing the Traffic Light
                      Controller Program .............................................                                                      208
                  Improving the Traffic Light Controller ...............................                                                    210
                  Experiment 13-2: Modifying the Traffic Light Controller ..............                                                    211
                  Programming Exercise 13-1: Traffic Light
                      Controller Modifications ........................................                                                     212
                  Review ............................................................                                                       213
                  Quiz ...............................................................                                                      214

               Lesson 14: Software Control of Peripherals ............................                                                      215
                 Introd uction ... . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ..   215
                 The Keyboard ......................................................                                                        215
                 Experiment 14-1: Using the Keyboard Read Routine ..................                                                        216
                 Programming Exercise 14-1: Electronic Lock ........................                                                        218
                 Scanning the Keyboard .............................................                                                        218
                 Experiment 14-2: Scanning the Keyboard ............................                                                        220
                 Debouncing ........................................................                                                        222
                 The Display ........................................................                                                       222
                 Experiment 14-3: Displaying a Message .............................                                                        224
                 Programming Exercise 14-2: Using the Keyboard and Display .:......                                                         227
                 Controlling the Display Directly .....................................                                                     227
                 Experiment 14-4: Controlling the Display Directly ....................                                                     228
                 Scanning All the Digits .............................................                                                      230
                 Experiment 14-5: Scanning the Display ..............................                                                       232
                 Review ............................................................                                                        233
                 Quiz ...............................................................                                                       234

              Lesson 15: Number Representations and Algorithms ...................                                                          235
                Introduction .......................................................                                                        235
                Negative Numbers ..................................................                                                         235
                Large and Small Numbers ..........................................                                                          236
                Decimal Number Representation ....................................                                                          238
                Representing Alphanumerics ........................................                                                         238
                Table Look-Up .....................................................                                                         239
                Mathematical Algorithms ...........................................                                                         240
                Review ............................................................                                                         242
                Quiz ...............................................................                                                        243


        v. TROUBLESHOOTING MICROPROCESSOR SYSTEMS ................... 245
              Lesson 16: Hand-Held Troubleshooting Tools ..........................                                                         247
                Introduction .......................................................                                                        247
                Experiment 16-1: Logic Probes ......................................                                                        248
                Experiment 16-2: The Logic Pulser ..................................                                                        255


Practical Microprocessors                                                                                                                         vii
 TABLE OF CONTENTS _ _ _ _ _ _ __


## Page 10


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


 ( Continued)
             Experiment 16-3: Stimulus-Response Testing Using the
                 Probe and the Pulser ...........................................                                                      259
             Experiment 16-4: The Current Tracer ................................                                                      263
             Review ............................................................                                                       269
             Quiz ...............................................................                                                      270

          Lesson 17: Signature and Logic Analyzers .............................                                                       271
            Introduction ..... . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ..      271
            Signature Analysis .................................................                                                       271
            Signature Tables for the Microprocessor Lab ........................                                                       272
            Experiment 17-1: Free-Running the Microprocessor Lab ..............                                                        274
            Experiment 17-2: Checking the ROM While Free-Running ............                                                          280
            Experiment 17-3: The SA Test Loop .................................                                                        282
            Logic Analyzers ....................................................                                                       288
            Review ............................................................                                                        292
            Quiz ...............................................................                                                       293

          Lesson 18: Troubleshooting Microprocessor Systems ..................                                                         295
            Introduction .. , . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ..   295
            Microprocessor Troubleshooting Problems ..........................                                                         295
            Problems Specific to Microprocessor Systems .......................                                                        297
            Self-Test Programs .................................................                                                       299
            Multiplexed I/O ....................................................                                                       300
            Interfaces ......................................................... -.                                                    300
            Troubleshooting Trees ..... . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ..                 300
            Other Documentation ..............................................                                                         301
            Is There Really a Problem? .........................................                                                       302
            What Can Be Learned from the Front Panel? . . . . . . . . . . . . . . . . . . . . . . ..                                   302
            What Does the Manual Say? ........................................                                                         302
            Production versus Field Failures ....................................                                                      303
            What Are the Easy Things to Test? ..................................                                                       304
            Common Production-Line Troubleshooting Problems ................                                                           304
            Mechanical Field Failures ...........................................                                                      305
            General Troubleshooting Techniques ... . . . . . . . . . . . . . . . . . . . . . . . . . . ..                              305
            How Can the Fault Be Isolated? .....................................                                                       307
            Digital Failure Modes ...............................................                                                      308
            Isolation Techniques ...............................................                                                       310
            Feedback Loops ...................................................                                                         310
            Conclusion ........................................................                                                        312
            Review ............................................................                                                        313
            Quiz ...............................................................                                                       314

          Lesson 19: Troubleshooting the Microprocessor Lab ...................                                                        315
            Introduction .......................................................                                                       315
            The Microprocessor Lab Troubleshooting Flowchart .................                                                         315
            Experiment 19-1: Familiarization with the Fault-Finding Process ......                                                     319
            Troubleshooting with an Oscilloscope ...............................                                                       327
            Troubleshooting the Faults .........................................                                                       327
            Atypical Features of the j.LLab .......................................                                                    329




## Page 11


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



_ _ _ _ _ _ _ _ TABLE OF CONTENTS
                                                                                                                                          (Continued)

                  Review ............................................................ 330
                  Quiz ............................................................... 331

        VI.   OTHER MICROPROCESSORS ......................................... 333

               Lesson 20: Microprocessor Survey ....................................                                                                335
                 The 8085 in Perspective ............................................                                                               335
                 Four-Bit Microprocessors ...........................................                                                               335
                 Sixteen-Bit Microprocessors ........................................                                                               336
                 Single-Chip Microcomputers ........................................                                                                336
                 Bit-Slice Processors ................................................                                                              336
                 Microprocessor Descriptions ........................................                                                               336
                 Review ............................................................                                                                343
                 Quiz ...............................................................                                                               344

        APPENDICES

               A. Solutions to Problems .............................................                                                               347
                 Answers to Quizzes ................................................                                                                348
                  Programming Exercise Solutions ....................................                                                               349
                 Programs for Experiments ..........................................                                                                352
                 Solutions to Troubleshooting Faults .................................                                                              353

              B. 808SA Instruction Set Reference ....................................                                                               365
                General ............................................................                                                                365
                 I nstruction and Data Formats .......................................                                                              368
                Addressing Modes .................................................                                                                  368
                Condition Flags ....................................................                                                                369
                Symbols and Abbreviations .........................................                                                                 369
                 Description Format .................................................                                                               370
                 Data Transfer Group ...............................................                                                                371
                Arithmetic Group ...................................................                                                                375
                Logical Group ... . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ..                381
                 Branch Group ......................................................                                                                386
                Stack, 1/0, and Machine Control Group .............................                                                                 390

              C. Signature Tables                ... . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ..   395

              D. Reading Logic Diagrams ........................................... 405

              E. Demonstration and Utility Programs ................................ 407
                 Demonstration Programs ........................................... 407
                 Utility Programs .................................................... 410

              F. Microprocessor Lab ROM Listing ................................... 413

              G. Expanding the Microprocessor Lab ................................. 423

              H. IC Data Sheets                                                                                                                     429


Practical Microprocessors                                                                                                                                 ix
TABLE OF CONTENTS _ _ _ _ _ _ __


## Page 12



( Continued)

     GLOSSARY                                                                   437

     BIBLIOGRAPHY    ........................................................... 449

     HARDWARE REFERENCE DIAGRAMS ...................................... 451

     QUICK REFERENCE CHART ........................................ Rear Cover
                                                                       Foldout


x                                                                  Practical Microprocessors


## Page 13




