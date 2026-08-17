# Practical Microprocessors

- Source PDF: `docs/Practical Microprocessors.pdf`
- Category: `microprocessor-lab-handbook`
- Printed: `March 1979`
- Pages: `1-40 of 484`
- Conversion: `pdftotext` with page markers
- Figures: `docs-classified/reference/practical-microprocessors-p001-040/figures`
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




_ _ _ _ _ _ _ _ _ LIST OF FIGURES

        Figure    Title                                                                          Page

        1-1.      Basic Microprocessor System .....................................                 7
        1-2.      Microprocessor-Based Digital Voltmeter ...........................                8
        1-3.      Three-State Drivers ................ , .. " ............ " ..... , . . . . .      9
        1-4.      Conceptual Equivalent of Three-State Driver .......................               9
        1-5.      Schematic of Typical Three-State Output ..........................                9
        1-6.      Circuit Showing Several Signals Sharing Single Data Line ..........              10
        1-7.      Three-State Drivers in a Microprocessor System ....................              10
        1-8.      Basic Microprocessor Signals .....................................               11
        1-9.      Conceptual Diagram of Eight-Bit Memory, Showing How All Memory
                      Cells Share Single Data Line ..................................              13
        1-10.     2K X 8 ROM......................................................                 15
        1-11.     1K X 8 RAM ......................................................                15
        1-12.     Assembling the Microprocessor Lab Case ..........................                17
        1-13.     Setting the Line Voltage ...........................................             17

        2-1.      Binary and Decimal Number Systems ..............................                 21
        2-2.      Decimal to Binary Conversion .....................................               23
        2-3.      Octal Number Representation .....................................                23
        2-4.      Hexadecimal Number Representation ..............................                 23

        3-1.      Levels of Intelligence .............................................             27
        3-2.      Microprocessor-Based AND Gate ..................................                 28
        3-3.      Flowcharting Symbols ............................................                29
        3-4.      AND Gate Flowchart ..............................................                29
        3-5.      Count to Ten Flowchart ...........................................               33
        3-6.      Conveyor Belt System ............................................                41
        3-7.      Conveyor Belt Controller Flowchart ................................              42
        3-8.      Modified Conveyor Belt Controller Flowchart .......................              43

        4-1.      Microprocessor Lab Memory Map .................................                  49
        4-2.      "Do Nothing" Flowchart ...........................................               54
        4-3.      Flowchart for Program to Copy Data from Input to Output Port .....               59

        5-1.      Registers and Memory ............................................                65
        5-2.      Program to Make Output Port Count in Binary .....................                67
        5-3.      Using Subroutines to Flash the Output Port LEOs ..................               73
        5-4.      Simplified Sequence of Events When Counter Is Interrupted ........               78
        5-5.      Detailed Program Flow When Counter Program is Interrupted .......                79

        6-1.      Simplified 8085 Block Diagram ....................................               83
        6-2.      Reading the Opcode from Memory for a MVI A Instruction ..........                84
        6-3.      Reading the Data for the MVI A Instruction ........................              85

        7-1.      Data Exchange Using Traditional Design Techniques ...............                95
        7-2.      Data Exchange Using a Bus to Reduce the Number of
                      Interconnecting Lines .........................................              96


Practical Microprocessors                                                                               xi
LIST OF FIGURES _ _ _ _ _ _ _ __


## Page 14



( Continued)

      Figure    Title                                                                   Page

      7-3.      Three-State Single-Line Bus with Four Talkers and
                     Two Listeners ................................................       96
      7-4.      Control Logic Selects Device to Be Involved in
                      Data Transfer .................................................     97
      7-5.      Bidirectional Talker/Listeners Connected to Bus Line ...............      97
      7-6.      Devices with Three-State Outputs Communicate with
                     Microprocessor through Data Bus .............................        98
      7-7.      Address Decoder Configured to Control Port Assigned to
                     Address 3000 .................................................       99
      7-8.      Data from Data Bus Stored in Latch Whenever Microprocessor
                    Writes to Address 3000 ........................................      100
      7-9.      Input Data Placed on Data Bus Whenever Microprocessor Reads
                    Address Assigned to Three-State Driver ........................      101
      7-10.     Decoder IC Provides Simple Way of Extending Number of
                     Devices That Can Be Selected .................................      101
      7-11.     Internal Address Decoder in ROM Reduces Number of Address
                     Lines Needed by External Address Decoder ....................       102
      7-12.     Addresses Assigned to Each of Four 256 Byte ROM
                     in a System ..................................................      103
      7-13.     Address Decoding for Four 256 Byte ROM
                     Example in Figure 7-12 ...................................... ~     103
      7-14.     Truth Table for Controlling RAM ..................................       104
      7-15.     Address Decoding and Control for 1 K Byte RAM Using
                    Truth Table in Figure 7-14 ....................................      104
      7-16.     Block Diagram of J,LLab ...........................................      105
      7-17.     Address Decoder Circuit for Questions 6, 7, and 8 ..................     108

      8-1.      System Add ress Map for J,L Lab .....................................    110
      8-2.      Address Decoding Circuit of J,LLab .................................     111
      8-3.      RAM Enabled (goes low) Every Time I nstruction Byte Is Read
                    for This Program Loop ........................................       115
      8-4. to   Order of Device Enables Follows Instruction
       8-9.         Sequence of Program .........................................        116
      8-10.     Linear Select Decoder ............................................       119
      8-11.     Logic Comparator Decoder .......................................         120
      8-12.     Logic Gate Decoder ..............................................        120
      8-13.     I/O Mapped Decoding Increases Total Address
                    Space by 256 Bytes ...........................................       121

      9-1.      RAM Circuit for J,LLab .............................................     126
      9-2.      1K x 8 Memory Using 2102 (1 K x 1) RAMs .........................        127
      9-3.      ROM Circuit for J,LLab .............................................     128
      9-4a.     J,LLab Input Port ...................................................    128
      9-4b.     J,LLab Output Port .................................................     129
      9-5.      Keyboard Interface Similar to That Used in J,LLab ...................    129
      9-6.      Scan Data for Pressed Key of Figure 9-5 ...........................      130


xii                                                                      Practical Microprocessors


## Page 15




_ _ _ _ _ _ _ _ _ LIST OF FIGURES
                                                                                   ( Continued)

        Figure    Title                                                                    Page

        9-7.      Display Interface Similar to That Used in J,LLab .....................    131
        9-8.      Serial Output Circuit of J,LLab ......................................    132
        9-9.      Chip Select Signal with Short Loop Program Running ..............         134
        9-10.     ROM Select Signal with Monitor Program Running .................          135
        9-11.     RAM Select Signal with Monitor Program Running .................          135
        9-12.     KYRD Select Signal with Monitor Program Running
                      (Fast Sweep Speed) ..........................................         136
        9-13.     KYRD Select Signal with Monitor Program Running
                      (Slow Sweep Speed) ..........................................         137
        9-14.     SCAN Se.lect Signal with Monitor Program Running ................         137
        9-15.     DSP Select Signal with Monitor Program Running ..................         138
        9-16.     Peripherals Interface Device Containing Three
                      8-Bit 1/0 Ports ................................................      139
        9-17.     UARTs Provide Serial Communication Interface Between
                      Two Systems .................................................         140

        10-1.     Control Port Register of J,LLab ..................................... 145
        10-2.     Address Demultiplexing Circuit Used for J,LLab ..................... 146
        10-3.     8085 System Timing .............................................. 147
        10-4.     Falling Edges of ALE Indicate Stable Addresses on AD0 ............ 149
        10-5.     Demultiplexed A0 Address Line Generated from Multiplexed
                       Address Line AD0 ............................................ 150
        10-6.     ALE Line Controls A0 ............................................. 151
        10-7.     Stable Data from AD0 Read into Microprocessor at Rising
                       Edge of READ Signal ......................................... 151
        10-8.     When READ Is High and ALE Is Low, the AD0 Line
                       Carries No Logic Signals ...................................... 152
        10-9.     Interrupt Circuitry of J,LLab ........................................ 153
        10-10.    Single-Step Circuit of J,LLab Advances Microprocessor
                       One Machine Cycle ........................................... 156
        10-11.    Data Bus Buffer of J,LLab .......................................... 158
        10-12.    Data Stored in Memory on Rising
                       Edge of WRITE Signal ........................................ 159
        10-13.    Data Read into Microprocessor on Rising
                       Edge of READ Signal ......................................... 159
        10-14.    Typical Instruction Cycle ........................................... 160
        10-15.    Timing for Fetching and Executing OUT Instruction . .... .. .. .. .. .. 161

        11-1.     Simplified Block Diagram of 8085 Showing
                       General-Purpose Registers .................................... 168
        11-2.     Indirect Addressing Using Hand L Registers ....................... 169
        12-1.     Hardware Equivalent of ANA Instruction ...........................        180
        12-2.     Flowchart for Program to Test Bit 3 of Input Port ...................     183
        12-3.     Rotate I nstruction Function .......................................      185
        12-4.     Flowchart for Programming Exercise 12-2 ..........................        185
        12-5.     Microprocessor Flags .............................................        187


Practical Microprocessors                                                                         xiii
LIST OF FIGURES _ _ _ _ _ _ _ __


## Page 16



(Continued)

          Figure    Title                                                                                              Page

          12-6.     Sequence of Events as Main Program Calls Routine A
                       Which Calls Routine B ........................................ 191
          12-7.     Operation of the Stack ............................................ 191

          13-1a.    Traffic Light Controller Main Program .............................                                 198
          13-1 b.   Sequencing Routine ..............................................                                   198
          13-2.     LED Connections for Traffic Light . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ..    199
          13-3.     Change Signal Routine ...........................................                                   200
          13-4.     Basic Delay Routine ..............................•...............                                  200
          13-5.     Traffic Light Controller Structure Chart ............................                               201
          13-6.     Long Delay Routine ...............................................                                  204

          14-1.     Keyboard Interface ...............................................                                  218
          14-2.     Switch Bounce ...................................................                                   222
          14-3.     Keyboard Debounce Flowchart ....................................                                    223
          14-4.     j.LLab Display Control .............................................                                227

.         15-1 .
          15-2.
          15-3.
                    Double Precision ................................................. 237
                    Fixed Point ....................................................... 237
                    Floating Point .................................................... 237
          15-4.     Table Look-Up for Binary to Seven-Segment Conversion ........... 240
          15-5.     Binary Multiplication ............................................... 241

          16-1.     Probe Power Connection Using IC Test Clip .......................                                   248
          16-2.     Using "Grabbers" to Get Power from j.LLab Power Slots .............                                 249
          16-3.     TTL Voltage Threshold for 545A Logic Probe ......................                                   250
          16-4.     Input Port Switch for j.LLab . . . .. . . .... .. . . .. . . .. . . .. . . .. . . .. . . .. ..      250
          16-5.     Key Input and Scan Circuit for 0-D Key Column ....................                                  251
          16-6.     Single-Step Control Circuit ........................................                                253
          16-7.     546A Logic Pulser Output Waveform for Normally Low Logic Node ..                                    255
          16-8.     Speaker Drive Circuit for j.LLab ....................................                               256
          16-9.     Output Port Latch Circuit .........................................                                 257
          16-10.    Logic Probe Inserted into D0 Test Hole ............................                                 259
          16-11.    RAM Decoder Circuit .............................................                                   260
          16-12.    Pulser Used to Increment Single-Step Circuit ......................                                 261
          16-13.    Proper Orientation of 547A Current Tracer on Circuit Trace.........                                 263
          16-14.    Current Activity for Various Circuits on j.LLab .......................                             265
          16-15.    Measuring Pulser Node Current with Current Tracer ................                                  266
          16-16.    Following Current on Rear Side of Board with Current Tracer .......                                 267

          17-1.     5004A Signature Analyzer .........................................                                  272
          17-2.     Location of Test Switches on j.LLab ................................                                274
          17-3.     Circuit Used to Open Data Bus and Cause j.LLab to Free-Run .......                                  275
          17-4.     Signature Analyzer Connections to j.LLab for
                        Free-Run Address Test Mode ..................................                                   276
          17-5.     Free-Run Address Test Set-Up Samples Data at Each of the
                        64K Addresses of Measurement Window .......................                                     277


    xiv                                                                                             Practical Microprocessors


## Page 17




_ _ _ _ _ _ _ _ _ LIST OF FIGURES
                                                                                    (Continued)

        Figure    Title                                                                     Page

        17-6.     Address Demultiplexing and Drive Circuit ..........................        278
        17-7.     Address Decoder Circuit ..........................................         279
        17-8.     Free-Run ROM Test Set-Up Samples Data Only During 2K
                      Addresses That ROM Is Being Read ...........................           280
        17-9.     Output LEOs Exercised During SA Test Loop ......................           283
        17-10.    Keyboard Input Circuit ............................................        285
        17-11.    Location of Fault Jumper W10 .....................................         286
        17-12.    Output Port Circuit ...............................................        287
        17-13a.   Logic Analyzer Used to Display Hex Address and Data in
                      Tabular Form So That Execution of Program Sequence
                      Can Be Followed .............................................          289
        17-13b.   Figure 17-13a Formatted in Binary .................................        289
        17-14.    Eight Data Bus Lines Displayed in Timing Analysis Mode ...........         290
        17-15.    Logic Analyzer in Expanded Map Mode Used to Indicate
                      Address Activity ..............................................        291
        17-16.    Map Display for Free-Run Mode Showing Equal Activity
                      at All 64K Add!@sses ..........................................        291
        18-1.     Typical Troubleshooting Tree for Product Incorporating
                      Signature Analysis ............................................        301
        18-2.     Using Sensitive Voltmeter for Locating Power Bus Short ............        307
        18-3.     Bus Conflicts Cause Bad, But Solid, Logic Levels ..................        309
        18-4.     Shorted Substrate Diode on Gate Input Pin Clamps
                      Node to Ground ..............................................          309
        19-1.     Microprocessor Lab Troubleshooting Diagram .....................           316
        19-2.     Location of Fault Jumper W1 and Address Bus Test Probe Holes....           319
        19-3.     Signature Analysis Set-Up for Free-Run Address Test Mode . . . . . . ..    322
        19-4.     Pulsing Current into A 11 Address Line .............................       324
        19-5.     Adjusting Current Tracer Sensitivity ...............................       324
        19-6.     Point at Which Current Changes ..................................          325
        19-7.     Scope Display of A 10 to A 11 Short ................................       327
        19-8.     All Twelve Fault Jumpers Have Two Positions: Normal and Faulty ...         328
       20-1.      Three-Chip 8080-Based CPU ......................................           337
       20-2.      6800 Control Signals, Showing a Read Operation ...................         338
       20-3.      6800 Write Operation .............................................         339
       20-4.      6800 CPU Registers ...............................................         340
       20-5.      Simplified F8 System Block Diagram ...............................         341
        B-1.      8085/8080 Assembly Language Reference .......................... 366
        0-1.      Functional Logic Diagrams ........................................ 406
        G-1.      A Circuit for Retaining the Single-Step Feature When
                      Using an External READY Input ...............................          426
                  5036A Board Trace Diagram ......................................           452
                  5036A Microprocessor Lab Schematic Diagram .....................           453
                  5036A Microprocessor Lab Block Diagram .........................           454


Practical Microprocessors                                                                          xv
LIST OF TABLES _ _ _ _ _ _ _ _ __


## Page 18




      Table    Title                                                                   Page

      2-1.     Number Systems                                                            22

      3-1.     Count to Ten Program in BASIC ..................................          34
      3-2.     Count to Ten Program in 8085 Assembly Language ................           34
      3-3.     8085 Machine Language Listing for Count to Ten Program ..........         36
      3-4.     Count to Ten Program in Three Languages ........................          36
      3-5.     Instruction List for Experiment 3-2 .................................     39

      4-1.     Program Listing ..................................................        54
      4-2.     Program to Copy Data from Input Port to Output Port ..............        59
      4-3.     Program Modified to Complement Data ............................          62

      5-1.     Counter Program Listing ..........................................        68
      5-2.     LED Flasher Using Subroutines ...................................         74
      5-3.     Interrupt Enable Routine ..........................................       77
      5-4.     Interrupt Service Routine ..........................................      78

      6-1.     Program Sequence Table for Experiment 6-1 .......................         89

      12-1.    Program to Demonstrate Logical Instructions ...................... 181
      12-2.    Program to Test Bit 3 ............................................. 184
      12-3.    Arithmetic Instruction Demonstration Program ..................... 188

      13-1.    Traffic Light Bit Patterns ..........................................    199
      13-2.    Traffic Light Main Program ........................................      201
      13-3.    Traffic Light Sequencing Routine ..................................      202
      13-4.    Traffic Light Change Routine ......................................      202
      13-5.    Simple Delay Routine .............................................       203
      13-6.    Delay Routine Using Register Pair .................................      203
      13-7.    Traffic Light Delay Routine ........................................     205
      13-8.    Traffic Light Controller Program ...................................     206
      13-9.    Traffic Light Main Program with Variable Green Times...... ........      210

      14-1.    Key Codes for KIND Routine ......................................        215
      14-2.    Program to Read Keyboard and Generate Beep
                   If "7" Is Pressed ..............................................     219
      14-3.    Key Column Data .................................................        219
      14-4.    Program That Reads One Rbw of Keyboard ........................          219
      14-5.    Program to Test for "2" Key .......................................      220
      14-6.    Message Display Program .........................................        224
      14-7.    Character Codes for DCD Routine .................................        225
      14-8.    Program to Display a "2" ..........................................      228
      14-9.    Display Subroutine ...............................................       230
      14-10.   Display Scan Program ............................................        231

      15-1.    Two's Complement Representation of -8 through +7 ............... 235
      15-2.    ASCII Codes ..................................................... 239


                                                                                     List of Tables


## Page 19




_ _ _ _ _ _ _ _ _ _ LIST OF TABLES
                                                                                   (Continued)

        Table     Title                                                                   Page

        B-1.     8085/8080 Assembly Language Reference ..........................         366
        C-1.     Free-Run Address Signatures .....................................        396
        C-2.     Free-Run ROM Signatures ........................................         398
        C-3.     S.A. Write Signatures .............................................      400
        C-4.     S.A. Read Signatures .............................................       402

        D-1.     Basic Gate Relationships                                                 405

        E-1.     Demonstration Programs ..........................................        407
        E-2.     Musical Notes for Organ Program .................................        408
        E-3.     Timing the Return ................................................       409
        E-4.     Util ity Routi nes ,..................................................   410
        E-5.     Decoded Display Digits ...........................................       411
        E-6.     Display Character Decoder ........................................       412
        E-7.     Undecoded Display Digits .........................................       412

        F-1.     User Symbols .................................................... 414
        F-2.     ROM Listing ...................................................... 415

        G-1.     Edge Connector Signals .......................................... 424
        G-2.     Restart Links ..................................................... 427


List of Tables
Practical Microprocessors                                                                        xvii
    THIS


## Page 20



    PAGE
    LEFT
   BLANK

    By




## Page 21




_ _ _ _ _ _ _ PREFACE


Preface
Practical Microprocessors                                 xix
_ _ _ _ _ _ _ PREFACE


## Page 22




You are about to invest approximately 50 hours of your time studying the             INTRODUCTION
HP5036A Microprocessor Lab Course. In return, you can expect to achieve the          TO THE
following objectives:
                                                                                     MICROPROCESSOR
  a. Acquire a practical knowledge of microprocessor system hardware.                LAB COURSE
  b. Gain a basic understanding of the software that is used to control a micro-
     processor system.
  c. Learn how the system uses this software to perform a wide variety of
     operations.
  d. Use this information to learn practical troubleshooting techniques that are
     applicable to any microprocessor system.

One of the most significant benefits that you will derive from this course is the
confidence that comes from understanding a total microprocessor system. This
confidence removes the mystery associated with the concept of using programs
to control the system hardware. This understanding will allow you to see how a
tiny piece of silicon, called a microprocessor, controls the system. Once you have
learned how the software and the microprocessor chip exercise this control,
learning how any microprocessor system works is merely a matter of mastering
the specific details of that system.

In addition, the new troubleshooting techniques that you will learn are also
applicable to systems other than those based on the microprocessor. They can,
in fact, be used to troubleshoot any type of digital equipment. Therefore, when
you have completed this course, you should be able to understand and trouble-
shoot any digital system by applying the knowledge you have gained to any
problem you may encounter.


Preface


## Page 23




       WHAT THE   Before beginning, a summary of the course contents and organization will help
MICROPROCESSOR    you understand the material that you will be studying. One of the most important
     LAB COURSE   characteristics of the course structure is that each section and lesson is modular.
                  Since each student starts with a different background and set of objectives, this
       CONTAINS   structure allows any of several methods of study to be used.

                  If you are studying this course in a formal class, your instructor will match the
                  course materials to the class objectives. If you are using this material for self-
                  study, read the following descriptions to learn what is covered in each lesson.
                  Then, read the alternate methods of study that are recommended at the end of
                  this introduction. By matching your background and objectives with these
                  recommendations, you can obtain the maximum benefit from the specific
                  material that you need to study.

                  The course is organized into six sections, each of which contains from one to five
                  lessons, as required. Each lesson contains experiments and quizzes to reinforce
                  the concepts presented and to show the practical applications of the information
                  you have just learned.

                  SECTION I, MICROPROCESSOR FUNDAMENTALS, contains three lessons that
                  provide a basic introduction to microprocessor systems.

                    Lesson 1, Introduction to Microprocessor Systems, supplies background infor-
                    mation on the purposes, applications, and history of computing systems in
                    general and microprocessor systems in particular.
                    Lesson 2, Number Systems, provides an introduction to number systems. The
                    binary, octal, decimal, and hexadecimal number systems are covered.
                    Lesson 3, Software Fundamentals, introduces you to some of the basic
                    concepts of programming. A brief explanation of the relationship between
                    software and hardware is included.

                  SECTION II, INTRODUCTION TO PROGRAMMING, contains three lessons that
                  provide an introduction to programming and instructions for using the Micro-
                  processor Lab (/-L Lab).

                    Lesson 4, Using the Microprocessor Lab, covers instructions for storing data,
                    running programs on the /-LLab, and using the input/output ports.
                    Lesson 5, Software Concepts, discusses additional programming techniques
                    and some of the more advanced features of the /-LLab.
                    Lesson 6, Inside the Microprocessor, takes a brief look inside the micro-
                    processor to show how programs are executed. This insight will help you
                    understand the system's operation.

                  SECTION III, MICROPROCESSOR SYSTEM HARDWARE, contains four lessons
                  that describe microprocessor system hardware in detail.

                    Lesson 7, Basic Hardware Concepts, describes basic microprocessor system
                    hardware. The emphasis is on helping you understand the fundamental parts
                    of a typical system.
                    Lesson 8, Address Decoding, describes the features and characteristics of the
                    /-LLab's address decoding circuits. Other types of address decoding circuits are
                    also discussed.


                                                                                          Preface
 xxii                                                                   Practical Microprocessors
   Lesson 9, Memories and Peripherals, covers the memories and peripherals


## Page 24



   used in the jlLab. In addition, it discusses other types of hardware that are used
   in a wide variety of systems.
   Lesson 10, Control Circuits, deals with the control signals used in micro-
   processor systems. It covers the circuits that generate, transmit, and respond
   to these signals. Electrical circuit considerations are also presented.


 SECTION IV, PROGRAMMING MICROPROCESSORS, contains five lessons that
 cover some of the more advanced concepts and techniques for programming
 microprocessors.

   Lesson 11, Registers and Breakpoints, presents background material for the
   more detailed discussion of software that is contained in the rest of the section.
   The microprocessor's registers are described and the use of the breakpoint as
   a software debugging tool is covered.
   Lesson 12, The 8085 Instruction Set, describes some additional instructions
   for programming the 8085. A representative group, including logical and
   arithmetic instructions, is presented.
   Lesson 13, Software Design Techniques, introduces a set of techniques for
   designing a complex software system. Emphasis is placed on designing soft-
   ware that is not only efficient but also easy to debug and modify.
   Lesson 14, Software Control of Peripherals, describes the software used to
   control the jlLab's keyboard and display. The specific programs that are used
   to read from the keyboard and write to the display are described. Since most
   systems include a keyboard and a display, these concepts are applicable to a
   wide variety of microprocessor systems.
   Lesson 15, Number Representations and Algorithms, discusses some of the
   techniques that are used to perform complex mathematical functions on a
   wide range of numbers.


SECTION V, TROUBLESHOOTING MICROPROCESSOR SYSTEMS, contains
four lessons that deal with the theory of troubleshooting and the new tools and
techniques that have been developed to troubleshoot microprocessor systems.

  Lesson 16, Hand-Held Troubleshooting Tools, covers the use of Logic Probes,
  Logic Pulsers, and Current Tracers. These three instruments are easy to use
  and very effective in a broad range of digital troubleshooting situations.
  Practical examples show how they can be used, individually and together, to
  locate faults in microprocessor systems.
   Lesson 17, Signature and Logic Analyzers, describes and shows how these
 . two specialized instruments are used to troubleshoot microprocessor systems.
   Practical applications in field service, production, and product development
   are explained.
  Lesson 18, Troubleshooting Microprocessor Systems, explains the trouble-
  shooting philosophy and methods used for microprocessor systems. Specific
  problems and their solutions are discussed.
  Lesson 19, Troubleshooting the Microprocessor Lab, describes the use of the
  troubleshooting flowchart for the jlLab. First, a fault is found using this
  flowchart, and then you are shown how to insert and find various faults in
  the system.


Preface


## Page 25




                    SECTION VI, OTHER MICROPROCESSORS, contains only one lesson. It
                    provides a survey of several currently available microprocessors.

                       Lesson 20, Microprocessor Survey, describes other types of microprocessors
                       and demonstrates that although the details vary from one microprocessor to
                       another, the concepts remain the same.

                    In addition to the information contained in the lessons, this course includes the
                    following eight appendices found in Section VII which provide reference infor-
                    mation for your use:

                      A. Solutions to Problems. Contains the answers to all the quiz questions and
                         solutions to all the programming and troubleshooting problems.
                      B. 8085 Instruction Set Reference. Contains a complete set of 8085 instruction
                         descriptions and hexadecimal codes.
                      C. Signature Tables. Contains troubleshooting signature information for all
                         test points and IC pins in the pLab.
                      D. Reading Logic Diagrams. Contains a brief description of the significance
                         of the logic level indicators used on logic symbols.
                      E. Demonstration and Utility Programs. Contains descriptions of these pro-
                         grams and directions for their use.
                      F. Monitor Listing. Contains a complete listing of the pLab's ROM contents.
                      G. Expanding the Microprocessor Lab. Contains a brief description of the
                         signal inputs and outputs at the edge connector of the pLab, along with
                         information on how to use these signals.

                    The reference material also includes an extensive glossary and bibliography that
                    are oriented to microprocessor system requirements.

                    The last page of the manual is a foldout schematic of the pLab. The inside of the
                    back cover contains the system error messages. The cover also folds out to present
                    a quick reference for the pLab with brief definitions of the keys and switches.


PREREQUISITES AND   The minimum prerequisite for the pLab course is an understanding of basic
    RECOMMENDED     digital circuits and symbology. If you need a complete review of this material,
                    refer to HP's Practical Digital Electronics Course.
STUDY PROCEDURES
                    If you want an overall knowledge of software, hardware, and troubleshooting
                    techniques, the best study procedure is to start at the beginning of the course
                    and work each lesson sequentially. If you want to study only selected portions of
                    the course, you can modify this sequence. The following figure shows which
                    lessons should be studied for each of these three subjects:
                       a. Hardware
                       b. Software
                       c. Troubleshooting

                    The dark shading indicates mandatory lessons, and the light shading indicates
                    optional lessons. For example, Lesson 7 provides an overview of microprocessor
                    hardware. If you are only interested in learning software, studying Lesson 7 is
                    not mandatory but it does provide excellent background information.


                                                                                            Preface
  xxiv                                                                    Practical Microprocessors
                                                                                Hardware              Trouble-


## Page 26



                                                                                                      shooting

I.     Microprocessor Fundamentals

       Lesson 1      Introduction to Microprocessor Systems . .

       Lesson 2      Number Systems .... ... ..... . . .. . . ... .. ... •

       Lesson 3      Software Fundamentals . . . ... ... ...... . . . .

II.    Introduction to Programming

       Lesson 4      Using the Microprocessor Lab .. ...... . . . ... .

       Lesson 5     Software Co ncepts .. ..... . . .•. ... . .. . .. ... .

       Lesson 6      Inside the Microprocessor ..... .. . . .. ...... . .

III.   Microprocessor System Hardware

       Lesson 7      Basic Microprocessor System Circuitry .... . .

       Lesson 8      Address Decoding . . ... . . . ... ..... . .. . ..... .

       Lesson 9      Memories and Peripherals .. .. . . ..... . .. . ... .

       Lesson 10 Control Circuits ..... . .. . . .•. . .. . . .. . . . .... .

IV.    Programming Microprocessors

       Lesson 11 Registers and Breakpoints ... ...... ... .... . .

       Lesson 12 The I nstruction Set . .. . ..... .. . ... . . .. . . ... .

       Lesson 13 Software Design Techniques .......... . . .. . .

       Lesson 14 Software Control of Peripherals .. .. ....... . .

       Lesson 15 Number Representations and Algorithms ....

V.     Troubleshooting Microprocessor Systems

       Lesson 16 Hand-Held T roubleshooting T oo ls . . . .. .. . .. .

       Lesson 17 Signature and Logic Analyzers . . .. . .... . . .. .

       Lesson 18 Troub leshooting Microprocessor Systems .. .

       Lesson 19 Troub leshooting the Microprocessor Lab ... .

VI.    Other Microprocessors

       Lesson 20 Microprocessor Survey . .. ... .. . .. •. .. .. .. . .

Lege nd :

                Required        L-_ _ _       ~I Optional but helpful                 --11 Not Required
                                                                                1-_ _ _


                                    Microprocessor Lab Study Guide


Preface


## Page 27




                                                                                                               I
_ _ _ _ MiCROPROCESSOR
           FUNDAMENTALS
                            The introduction of the microprocessor has caused a dramatic change in the
                            design of logic systems. In the traditional approach, often called "random" or
                            "hardwired" logic, systems are designed using individual logic blocks (such as
                            flip-flops, gates, and counters) as required by the application. These blocks are
                            interconnected to provide the needed data flow. Using random logic, each appli-
                            cation requires a unique design, and there is little similarity among different
                            systems. This approach is similar to analog circuits in that the structure of the
                            circuit parallels the function being performed. Once constructed, the function of
                            the circuit is difficult to change.

                            The microprocessor, on the other hand, provides a general-purpose control
                            system which can be adapted to a wide variety of applications with little circuit
                            modification. The individuality of different systems is provided by a list of instruc-
                            tions (called the program) which control the system's operation. There are there-
                            fore two different aspects of microprocessor systems: the actual components
                            (called hardware), and the programs (called software).

                            This section first introduces the hardware that makes up a microprocessor
                            system. Then software concepts and programming languages are discussed.
                            Finally, an example of how hardware and software work together as a logic device
                            is presented.


Lesson 1
Practical Microprocessors                                                                                        1
    THIS


## Page 28



    PAGE
    LEFT
   BLANK

    By




## Page 29




_ _ _ _ _ _ _ _ _ Lesson 1
                                                                    Introduction to
                                                           Microprocessor Systems


The microprocessor is a large, complex integrated circuit (Ie) containing all the       INTRODUCTION
computation and control circuitry for a small computer. It provides economical
computing power for many devices, including "smart" voltmeters, microwave
ovens, cash registers , and even games. In this lesson , the general operation of
microprocessor systems and the building blocks which are used are described .


The earliest electronic computers were built using thousands of vacuum tubes.           THE DEVELOPMENT
These machines were extremely large and unreliable, and were mostly a labora-
tory curiosity. The next generation was built with transistors, which made
                                                                                        OF THE
computers much more reliable and reduced their size and cost. These "solid-             MICROPROCESSOR
state" machines marked the beginning of the computer as a practical device.


ENIAC Calculating Machine. Built in 1946, it was the first general-purpose electronic
computing machine. It used over 18,000 vacuum tubes and required a power supply half
the size of the computer itself. ( Photo Courtesy UPI )


Lesson 1
Practical Microprocessors                                                                              3
    In the 1960s smaller, more powerful computers were built using hundreds of


## Page 30



    gates, flip-flops, and other similar integrated circuits. These ICs are called
    Small Scale Integration (SSI) devices. As semiconductor technology developed ,
    it became possible to put dozens of gates on a single IC. Examples of these
    Medium Scale Integration (MSI) ICs are counters, decoders, registers, and
    adders.


    Programmable Desktop Calculator. Introduced in 1968, it is more powerful than the
    much larger ENIAC and is built with discrete transistors.

    This miniaturization trend continued , and in 1971 the first microprocessor (the
    4004) was introduced . Microprocessors contain the major computation and con-
    trol sections of a computer, called the Central Processing Unit (CPU), on a single
    integrated circuit "chip." Microprocessors are often called Microprocessing Units
    (MPUs). A microprocessor chip contains thousands of gates and is called a
    Large Scale Integration (LSI) device. LSI memory devices were also developed
    that store thousands of bits of digital information on a single IC. These two LSI
    devices made it possible to drastically reduce the size and cost of small com-
    puters. Microprocessors have made it practical to build dedicated computers into
    many small , inexpensive products.


    Hand-Held Programmable Calculator. Inte-        Single-Chip Microcomputer. Less
    grated circuit technology made possible a       than a quarter of an inch on a side,
    hand-held calculator more powerful than         this tiny ch ip contains virtually
    the desktop calculator pictured above.          all the electronics for a small
                                                    computer system. (Photo Courtesy
                                                    Intel Corp.)


                                                                          Lesson 1


## Page 31




Microprocessors are now being used in many products which were previously               WHY
built with random logic. Microprocessor-based designs are usually less expensive
                                                                                        MICROPROCESSORS
and have many fewer components than the designs that they replace. Small
microprocessor systems may be built with one or two les, at a cost of under ten         ARE USED
dollars. These can often replace boards with dozens of simpler les. Because the
number of discrete components and interconnections is greatly reduced, rel i-
ability is also improved .


This reduction in size is also possible using custom integrated circuits instead of
microprocessors. However, the design of a custom Ie can be an extremely
complex and expensive process, often costing well over $100,000. This expense
can be justified only for high volume products where the development cost can
be spread over many thousands of units. The microprocessor allows standard les
to be used to achieve the same miniaturization. The customizing takes the form
of the program stored in the memory. Producing a standard memory w!th a
custom program stored in it is a relatively inexpensive process.


The flexibility and power of microprocessor-based systems makes many sophisti-
cated features possible, which in the past were impractical. For example,
microprocessor-based systems can often test themselves to a considerable ex-
tent and provide appropriate error messages. Instruments such as digital volt-
meters can provide functions such as automatic averaging of a number of meas-
urements, addition or subtraction of an offset value from each measurement,
and self-calibration. The microprocessor also makes practical the use of a key-
board instead of multi position switches on the front panel. Another feature is
the capability for complete remote control.


                                                ,   ,
                                               OEl


Microprocessor-Based Digital Voltmeter. The microprocessor provides functions such
as self-calibration, averaging of a number of measurements, and automatic addition of
an offset value.


One of the most visible products to emerge from microprocessor technology is
the electronic cash register or Point of Sale (PaS) terminal. By replacing older
electromechanical machines, reliability has been improved and many new fea-
tures have become possible. By assigning each item to be sold an identification
number, which the operator either types on the keyboard or reads from a bar
code, inventory can be kept automatically. Sales tax can also be automatically
added . It is even possible for the customer's bank account number to be entered ,
and the money automatically transferred from his bank account to the store's
account.


Lesson 1
Practical Microprocessors                                                                           5
                  Another example of the convenience which can be provided by microprocessor-


## Page 32


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


                  based products is the computing scale. The operator enters the price per pound ,
                  and the scale weighs the item and displays the weight and the cost. The scale can
                  also subtract the weight of the container.


                  Microprocessor-Based Scale.    The user enters the price per pound, and the scale
                  computes the total price. The weight of the container can also be automatically
                  subtracted. ( Photo Courtesy Toledo Scale)


                  All of these products may have been possible without microprocessors, but they
                  would be so complex and expensive that they would be impractical. Micro-
                  processor-based systems have these capabilities because so much complexity
                  has been placed inside each IC. Product designers do not have to worry about the
                  detailed construction of the ICs, and the size and reliability problems associated
                  with complex systems are avoided . Furthermore, by placing the control in soft-
                  ware, design changes are easy to make. The microprocessor has indeed revolu-
                  tionized the design of many products.


        A BASIC   Consider a system with a keyboard and a numeric display, as in a pocket calcu-
                  lator. When a key is pressed , the corresponding number should appear on the
MICROPROCESSOR
                  display. This system is a natural application for a microprocessor, and is in many
        SYSTEM    ways similar to the Microprocessor Lab.


                  Figure 1-1 shows the block diagram of a system for doing this. The micro-
                  processor (also called the processor) is the "brains" of the system . It contains all
                  of the logic to recognize and execute the list of instructions (program). The
                  memory stores the program, and may also store data. The fold-out inside the
                  back cover shows these components on the Microprocessor Lab (J,LLab) board.


                  The microprocessor needs to exchange information with the keyboard and dis-
                  play. The input port, from which the processor can read data, connects the
                  processor to the keyboard. The output port , to which the processor can send
                  data, connects the processor to the display.


                                                                                          Lesson 1


## Page 33


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



The blocks within the microcomputer are interconnected by three buses. A
bus is a group of wires which connect the devices in the system in parallel. The
microprocessor uses the address bus to select memory locations or input and
output ports. You can think of the addresses as post office box numbers ; they
identify which locations to put information into or take information out of.


 Once the microprocessor selects a particular location via the address bus, it
 transfers the data via the data bus. Information can travel from the processor to
 the memory or an output port, or from an input port or memory to the processor.
 Note that the microprocessor is involved in all data transfers. Data usually does
 not go directly from one port to another, or from the memory to a port.


The third bus is called the control bus. It is a group of signals which are used by
the microprocessor to notify memory and I/O devices that it is ready to perform
a data transfer. Some signals in the control bus allow I/ O or memory devices to
make special requests from the processor. The control bus is not apparent on the
J..LLab board because it connects directly to the control logic, which generates
control signals for each device in the system.


A single digit of binary information (1 or Or is called a bit (a contraction of binary
digit). One digital signal (high or low) carries one bit of information. Micro-
processors handle data not as individual bits, but as groups of bits called words.
The most common microprocessors today use eight-bit words, which are called
bytes . These microprocessors are called eight-bit processors. For an eight-bit
processor, byte and word are often used interchangeably. Be aware, however,
that word is also used to mean a group of sixteen or more bits.

The address and data buses may also be seen on the J..LLab board . The data bus
is a group of eight lines, and the address bus has sixteen lines.


                MICROCOMPUTER
                r----------~------~
                I                                                    I
                I                                                    I
                I                                                    I
                I                                                    I
                I                                                    I

   Keyboard                                                                 Display


  Input                                                                    Output
  Periphera l                                                        I     Peripheral
                                                                     I
                                                                     I
                                                                     I
                                                                     I
                I                                                    I
                ~-----------------~

                       Figure 1-1.   Basic Microprocessor System


Lesson 1
Practical Microprocessors                                                                7
     PROGRAMS     To direct the system to perform the desired task, an appropriate list of instructions


## Page 34


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


                  is required . For example:

                      1. Read data from the keyboard .
                      2. Write data to the display.
                      3. Repeat (go to step 1).

                  For the microprocessor to perform a task from a list of instructions, the instruc-
                  tions must be translated into a code that the microprocessor can understand.
                  These codes are then stored in the system 's memory. The microprocessor begins
                  by reading the first coded instruction from the memory. The microprocessor
                  decodes the meaning of the instruction and performs the indicated operation.
                  The processor then reads the instruction from the next location in memory and
                  performs the corresponding operation. This process is repeated , one memory
                  location after another.

                  Certain instructions cause the microprocessor to jump out of sequence to
                  another memory location for the next instruction . The program can therefore
                  direct the microprocessor to return to a previous instruction in the program,
                  creating a loop which is repeatedly executed . This enables operations which
                  must be repeated many times to be performed by a relatively short program .


    PERIPHERALS   A complete microprocessor system, including the microprocessor, memory, and
                  input and output ports is called a microcomputer. The devices connected to the
                  input and output ports (the keyboard and display for example) are called periph-
                  erals, or Inputl Output (110) devices. The peripherals are the system's interface
                  with the user. They may also connect the microcomputer to other equipment.
                  Storage devices such as tape or disc drives are also referred to as peripherals.

                  An example of a microprocessor application from the instrumentation field is the
                  microprocessor-based digital voltmeter (see Figure 1-2). Its input peripherals
                  are an analog-to-digital converter and the range and function selector switches.
                  The output peripheral is a digital display. The basic microcomputer is the same,
                  whether the application is a calculator or a voltmeter; the difference is in the
                  peripherals and the proqram.


                                            MICROCOMPUTER
                                            ~-----------------,
                                            I                                         I
                                            I                                         I
                                            I                                         I
                                            I                                         I
                        Inpul   ~-~
                                 0191181                                             I
                                Converter

                                                                                          Display
                                 Function
                                Selector
                                Switch••
                                                                                     I
                                                                                     I
                                                                                     I
                                                                                     I
                                                                                     I
                                            I                                        I
                                            ~-----------------~


                                  Figure 1-2.   Microprocessor-Based Digital Voltmeter


                                                                                          Lesson 1


## Page 35


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



All devices in the microprocessor system exchange information with the micro-                    THREE-STATE
processor over the same set of wires (the data bus). The microprocessor selects
                                                                                                 DRIVERS
one device to place data on the data bus and disconnects the others. It is the
three-state output capability of the devices on the bus that enables the proces-
sor to selectively turn devices on and off .


                                                            -  -
                                                            Enable            Input   Output


   Input :        9>>-------t.~              Output
                                                               0
                                                               0
                                                               1
                                                                               0
                                                                               1
                                                                               0
                                                                                          0
                                                                                          1
                                                                                      floating
 Enable                                                        1               1      floating

                                                        o = low      1 = high


                               Figure 1-3.   Three-State Driver

Figure 1-3 shows the symbol and truth table for a three-state buffer (often called
a three-state driver). The buffer has an output enable in addition to the usual
input and output. When the enable is low, the buffer acts just as an ordinary
buffer. The signal at the input is transferred to the output. When the enable is
high , on the other hand , the output of the device is essentially disconnected.


             Input ~---t                                    o'-----~.~ Output


                                                        I
                                + 5 ------:,~

             Enable ~.----------~-


              Figure 1-4.     Conceptual Equivalent of Three-State Driver

Figure 1-4 shows a conceptual equivalent circuit which generates the open state
using a relay. The disabled (open) output state is often called the high im-
pedance state. Figure 1-5 shows a schematic of a typical three-state output.


                                        .--~---~~VCC


                     Data
                                                                   Output

                              Control
                                             ' - - - - - - - 4 - - 0 Ground


                Figure 1-5.     Schematic of Typical Three-State Output


Lesson 1
Practical Microprocessors                                                                                      9
     Three-state drivers are important because they allow many devices to share a


## Page 36


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


     single data line. The circuit shown in Figure 1-6 allows anyone of three different
     signals to drive one output. Only one driver's enable line may be low, and that
     device drives the output. If more than one driver were enabled, they would both
     try to drive the output. This condition is not allowed because the logic state of the
     output would be unpredictable.


                         Enable A ......- - - - ,

                         Signal A


                         Enable B ~---...,
                                                          __--~~ Output
                         Signal B


                         Enable C

                         Signal C


           Figure 1-6.    Circuit Showing Several Signals Sharing Single Data Line


     Many devices, including microprocessors and memories, contain internal three-
     state drivers. These ICs have an output enable, often called Chip Select (CS) or
     Chip Enable (CE), which controls their output drivers.

     Figure 1-7 shows how three-state drivers are used in microprocessor systems.
     All devices which put data on the data bus have three-state drivers on their out-
     puts. The microprocessor generates control signals (part of the control bus) to
     enable the three-state drivers of the device from which it wants to read data. The
     three-state drivers of the other devices are disabled.


                                                                             Output Port


                  Figure 1-7.       Three-State Drivers in Microprocessor System


                                                                                 Lesson 1


## Page 37


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



                                                                    ,
                                                                    .


8085 Microprocessor in Package with Lid Removed. Forty thin wires connect pads on
the chip to connection pOints on the package. ( Photo Courtesy Intel Corp.)


Figure 1-8 shows the basic signals that connect to a typical microprocessor.        THE
There are sixteen address outputs which drive the address bus, and eight data
                                                                                    MICROPROCESSOR
pins which connect to the data bus. The data pins are bidirectional, which means
that data may go into or out of them . READ and WRITE are the control signals
that coordinate the movement of data on the data bus.

                                   Crystal


                                  ~      ~
                                  X1     X2
                                               AO           .
                                               A1
                                               A2
                          . RESET              A3
                                               A4
                                               AS
                                               AS
                                               A7                       Address
                                               AS                       Bus
                                               Ag
                                               A10
                             INTERRUPT         A11
                                               A12
                                               An
                                               A14
                                               A1S

                                                DO   ~
                                                            .
                                                D1
                                                D2
                                                D3                      Data
                                                D4                      Bus
                                                DS
                                                Ds
                                                D7

                                             READ               }       Control
                                                           -"
                                             WRITE


                    Figure 1-8.   Basic Microprocessor Signals


Lesson 1
Practical Microprocessors                                                                      11
                The two signals shown on the left of the diagram provide additional control


## Page 38


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


                functions. The RESET input is used to initialize the microprocessor's internal
                circuitry. The INTERRUPT input allows the microprocessor to be diverted from
                its current task to another task which must be performed immediately. The use
                of these signals, plus others which have not been mentioned here, is described in
                section III, Microprocessor System Hardware.

                The two connections at the top are for an external crystal, which is used to set
                the frequency of an oscillator in the microprocessor. The output of this oscillator
                is called the system clock. The clock synchronizes all devices in the system and
                sets the rate at which instructions are executed.


     MEMORIES   Microprocessor systems usually use integrated circuit memories to store pro-
                grams and data. They can store many bits of data in a single IC. Currently,
                devices are available with capacities of over 65,000 bits on one chip. A 65,536-bit
                memory can store over eight thousand alphanumeric characters, or about three
                pages of this text on a piece of silicon about a third of an inch square.

                The simplest memory device is the flip-flop, which stores one bit of information.
                Registers contain up to eight flip-flops on a single IC, each with its own data in
                and data out pins but with a common clock line.

                LSI technology made it possible to put thousands of flip-flops on a single IC, but
                a new problem was created. With thousands of flip-flops on an IC, there cannot be
                a separate data pin for each. The solution to this problem is to use address
                inputs to select the particular memory location (flip-flop) of interest. A decoder
                on the memory chip decodes the address and connects the selected memory
                location to the data pins.


                Figure 1-9 shows a conceptual diagram of an eight-bit memory (most memories
                are much larger). Only the data output circuits are shown for simplicity. The
                decoder converts the binary address inputs to eight separate outputs, one for
                each possible combination of the three address lines. These signals control the
                three-state drivers at the output of each memory cell (flip-flop). The data from
                the addressed cell is placed on the data output line. This technique allows a
                single data pin to be used for all locations on the memory chip.

                Each memory location can contain a group of bits rather than just one bit as in
                the example above. Each can hold one, four, or eight bits, depending upon the
                particular IC. If the IC has eight data pins, then each memory location stores
                eight bits of data. Note that while the memory may contain thousands of loca-
                tions, only one may be accessed at a time.

                The number of addressable locations depends upon the number of address lines.
                With one address line, two locations can be selected: address 0 and address 1.
                With two address lines, one of four locations can be selected: 00,01, 10 and 11.
                The general rule is:
                    Number of locations = 2N
                    Where N = number of address lines


                                                                                       Lesson 1
12                                                                    Practical Microprocessors


## Page 39


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



                        r----------l
                                               Memory Cell
                                              Select Signals
                                                                 Memory Cells
                                                                  (Flip-Flops)
                                                                                 3·State
                                                                                 Output
                                                                                 Drivers
                                                                                           I
                                                                                           I
               -....:.....-.L--_oi C                   °   [)---"---=-------'
                                                                                           I
               __0:.......;=-----____.... B   Binary
                                                                                           I
   Address                                    Select
                                              Inputs
                                                       1   0-----===-----'                 I
               --.:.--=-----.... A                     2 [)-----:""==------'               I
                                                                                           I
                                                       30-----==:0------'                  I
                                                                                   .>-ot--.-1----i... Data
                                                       4   [)-----===----'
                                                                                           I
                                                       5 [)-----==::-----'
                                                                                           I
                                                       60----------'
                                                                                           I
                                              I
                        L __________ ....II
                              7 [)----------'


Figure 1-9.   Conceptual Diagram of Eight-Bit Memory, Showing How All Memory Cells
              Share Single Data Line. Location 5 (101 binary) is shown selected.


The memory les used with microprocessors fall into two broad categories:                                     ROMS AND RAMS
ROMs and RAMs. A ROM (Read Only Memory) is a memory which can only be
read. The data is programmed into it at the time of manufacture, or by a special
programming procedure prior to installation in the circuit. A program recorded
into a ROM is often referred to as firmware.


A RAM (Random Access Memory) is a memory into which data can be stored
and then retrieved. RAM is actually a misnomer; random access means that the
time to access any memory location is the same, a characteristic also present in
ROMs. Read/Write (R/W) memory is a more accurate term for what are usually
called RAMs, but RAM is widely used to mean integrated circuit read/write
memory. A digital tape recorder is an example of a memory which is not random
access, since the time to access a particular location depends upon the position
of the tape.


Lesson 1
Practical Microprocessors                                                                                               13
     Photomicrograph of 4,096-Bit RAM. The chip is 0.225 x 0.142 inches. (Photo Courtesy


## Page 40


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


     Intel Corp. )


     An important characteristic of semiconductor RAMs is that they are volatile :
     they lose their data when power is turned off, and when turned back on , they
     contain unknown data. ROMs do not have this problem, so they are used for
     permanent program and data storage. Since the contents of a ROM cannot be
     modified , RAMs must be used for temporary program and data storage.

     Figure 1-10 shows a ROM containing 2,048 words of eight bits each, or 16,384
     bits. When using large numbers that are powers of two, K is often used to mean
     1,024 (210). Thus, this memory has 2K bytes or 16K bits. Since each location
     contains eight bits, it is called a 2K x 8 ROM .

     When the Chip Select (CS) input is low, the ROM 's output drivers are enabled.
     When CS is high , the data outputs are in the high impedance state. The three-
     state outputs allow the data lines of many memory devices to be connected
     together, with one device selected by bringing its CS input low.

     Figure 1-11 shows a 1 K x 8 RAM. This RAM contains 1,024 locations of eight
     bits each. The data lines are bidirectional , since data can go into or out of the
     memory. RAMs have an additional control line called WRITE. To store data in the
     RAM, an address is selected, the data is placed on the data lines, and the WRITE
     line is brought low. When the data and address are all set, the chip select is
     pulsed, and the data is stored in the memory.

     The write line determines the direction of the data flow. The write line is usually
     active low, and is often called RO/ WR (or R/ W ). This notation indicates that if
     the signal is high , a read is performed , and if it is low, a write is performed. Note
     that this input has no effect unless the chip select is true.

     ROMs and RAMs come in many different sizes (with different numbers of words
     and different numbers of bits per word) and many types. Lesson 9 contains
     additional information on ROMs and RAMs.


                                                                                Lesson 1


## Page 41




