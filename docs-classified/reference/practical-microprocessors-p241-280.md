# Practical Microprocessors

- Source PDF: `docs/Practical Microprocessors.pdf`
- Category: `microprocessor-lab-handbook`
- Printed: `March 1979`
- Pages: `241-280 of 484`
- Conversion: `pdftotext` with page markers
- Figures: `docs-classified/reference/practical-microprocessors-p241-280/figures`
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

## Page 241





_ _ _ _ _ _ LESSON 14
                                       Software Control of Peripherals


This lesson describes the software that controls the Microprocessor Lab's key-       INTRODUCTION
board and display. Programs to read from the keyboard and write to the display
are described. The programs are presented in two stages. First, the monitor's key-
board and display control subroutines are used. Then an independent program is
described to show the software required to interface to a keyboard and display.
The concepts described are applicable to a wide variety of microprocessor-based
systems, since most systems include a keyboard and display.


The keyboard is arranged as a matrix of keys, with each row read separately          THE KEYBOARD
(the hardware is described in Lesson 9). The data is read from each row and
converted to the code for the pressed key by a software routine called KIND (Key
Input and Decode), stored in the IlLab's ROM. This routine and several others
are described in Appendix E. Using the routine is quite simple: you call the
routine, and it returns when a key is pressed. The accumulator then contains the
code for the key pressed. (Table 14-1 shows the code for each key.) This monitor
subroutine can be used in your programs to read the keyboard.


                                 KEY           CODE
                                  0             00
                                  1             01
                                  2             02
                                  3             03
                                  4             04
                                  5             05
                                  6             06
                                  7             07
                                  8             08
                                  9             09
                                  A             OA
                                  B              OB
                                  C              OC
                                  D              00
                                  E              DE
                                  F              OF
                             FETCH REG           80
                             DECR                81
                             FETCH ADRS          82
                             STORElINCR          83
                             RUN                 84
                             FETCH PC            85
                             INSTR STEP          86
                             HDWR STEP           F7


                    Table 14-1. Key Codes for KIND Routine


Lesson 14
Practical Microprocessors                                                                       215
EXPERIMENT 14-1 _ _ _ _ _ _ _ __


## Page 242



Using the Keyboard Read Routine


      CONCEPT
      The keyboard read routine, supplied as part of the monitor, is used to read the keyboard. The value
      of the pressed key is then compared to a specified value. A beep is generated if the specified key
      is pressed.

      PROCEDURE
       A) Code the program in Table 14-2 and key it in. This program illustrates a simple keyboard applica-
          tion. Two monitor subroutines are used: KIND (address 014B) and BEEP (address 0010).


                   Address           Contents       Label          Instruction           Comments
                     0800                         READ:         CALL KIND            ;Read key
                     0801
                     0802
                     0803                                       CPI    07            ;Compare keycode
                     0804
                     0805                                       JNZ     READ
                     0806
                     0807
                     0808                                       CALL BEEP            ;Generate beep
                     0809                                                             if key = 7
                     080A
                     080B                                       JMP READ
                     080C
                     0800

                       Table 14-2.    Program to Read Keyboard and Generate Beep If "7" Is Pressed

          The keyboard is read by the KIND routine, which waits until a key is pressed and then returns,
          leaving the key code in the accumulator. The CPI 07 instruction sets the processor's zero flag if the
          accumulator is equal to seven. The JNZ READ instruction then causes the program to jump
          back to the beginning if the zero flag is not set. If the zero flag is set, indicating that the key code
          was equal to seven, the JNZ instruction has no effect and the BEEP program is called. The
          process is then repeated. A beep is thus generated whenever the 7 key is pressed.

       B) Verify that the program is correctly stored.

       C) Run the program. Note that when        B     is pressed, nothing seems to happen. The program is
          running, but since the KIND routine scans the display while reading the keyboard, the display
          remains lit. The monitor program is not running.


                                                                                                        Lesson 14
216                                                                                     Practical Microprocessors


## Page 243




_ _ _ _ _ _ _ _ _ EXPERIMENT 14-1
                                                                                             Continued


                                                            A
     D) Press   0.   The speaker will beep. Now press any other key. Only the 7 key generates a response.

     E) Press [RESET) to return control to the monitor. Modify the program to detect a different key (refer
        to Table 14-1).

     F) Test the mQdified program.

     G) Press [RESET) to return control to the monitor.


   SUMMARY

   The monitor's key read routine (KIND) was used to read the keyboard. A beep was generated when a
   particular key was pressed. By changing the value that the key was compared with, any key could
   be detected. Using the monitor's KIND subroutine makes reading the keyboard a simple process.


Lesson 14
Practical Microprocessors                                                                                     217
   PROGRAMMING        Write a program, similar to the one in Table 14-2, which generates a beep only if


## Page 244


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


   EXERCISE 14-1:     a particular sequence of two keys is pressed. This program could form the basis
                      for an electronic lock. Begin by drawing a flowchart, and then write the actual
ELECTRONIC LOCK
                      program. Key the program into the j..(Lab, and then test and debug it.


       SCANNING THE   While the monitor's key read routine makes it easy to use the keyboard, it does
          KEYBOARD    not give you the chance to see what is involved in the reading process. To explain
                      the technique used to read the keyboard, this section describes a program that
                      reads the keyboard without using any monitor subroutines.

                      A diagram of the keyboard interface appears in Figure 14-1. As described in
                      Lesson 9, the keyboard is scanned one row at a time. For simplicity, consider


                                0
                                                                   "Key Read"
                                a
                                                                    Input Port              Address 1800 Select
                                I
                                                                  Address 1800
                                a
                                                                  0   1     2   3
                                B
                                u         +5                                                          +5
                                s
                                          +5                                                          +5
                                                        INSTR             FETCH           HDWR
                                                         STEP               PC            STEP
                                                        ...J...           ...J...         ..J...

                                                                                              ~


                             "Scan" 2 "'~---'
                             Output
                              Port
                             Address 4 1+0.:..----.
                              2800


                           Address 2800
                              Select


                                 Figure 14-1. Keyboard Interface. The 2 key is shown pressed.


                                                                                                    Lesson 14


## Page 245




     reading only a single row of keys (e.g., the "1," "2," and "3" keys). Reading a row
     of keys is a two-step process:
          • Write data to the scan port to select the desi red row.
          • Read the column data from the key read port.

     Each bit of the scan port is set high (logic one), except for the bit driving the
     row to be read, which is set low. Therefore, to read the 1, 2, and 3 keys the
     data 11110111 (F7 hex) is written to the scan port (refer to Figure 14-1). Then the
     key input port is read to get the column information. If no keys are pressed, bits
     0-3 are all high (one) because of the pull-up resistors. If the 1 key is pressed, bit
     o is low. If the 2 key is pressed, bit 1 is low, and if the 3 key is pressed bit 2 is low
     (see Table 14-3). Note that none of the other keys affects the data read from the
     keyboard, since the scan port is set to "turn off" all but one row.


                            no keys pressed           XXXX     X111
                            "1" key pressed           XXX X    X110
                            "2" key pressed           XXX X    X101
                            "3" key pressed           XXXX     X011


         Table 14-3. Key Column Data. The Xs in the most-significant five bits
         indicate that these bits will contain Unknown data. The information of interest is
         contained in the least-significant three bits.


     Note that the data read from the keyboard is a code that identifies the key, but
     it is not the actual key value. If the 2 key is pressed, for example, then the
     accumulator will contain 05 hex (assuming the five most-significant bits are zero).
     The KIND routine used in the previous experiment reads all the rows and con-
     verts these codes to actual key values.

     Table 14-4 shows a program to perform the reading process just described. The
     scan port is set to select the desired row, and the column data is read into the
     accumulator.


                    MVI A,F7         ;Set scan port to 1111 0111 to select row
                    STA 2800
                    LDA 1800         ;Read key columns

~-


                    Table 14-4.   Program that Reads One Row of Keyboard.


     Lesson 14
     Practical Microprocessors                                                                   219
EXPERIMENT 14-2 _ _ _ _ _ _ _ __


## Page 246



Scanni ng the Keyboard


      CONCEPT
  In this experiment, the keyboard is read by setting the scan port and reading the key data port. This
  demonstrates the basic principle of the monitor's keyboard read program used in the previous experi-
  ment. The column data is compared with the expected value for a specified key, and a beep is generated
  if the values match.


  PROCEDURE
      A) Code and key in the program in Table 14-5. As previously described, this program reads a row of
         keys. The data is ANDed with a mask (0000 0111) to set all except the least-significant three bits to
         zero. These three bits contain the data from the keyboard, as shown in Table 14-3. The result is
         then compared with the value 0000 0101, which occurs if the 2 key is pressed. If the values are
         equal, a beep is generated by the monitor's BEEP routine.


                  Address      Contents       Label          Instruction             Comments
                    0800                                  MVI    A,F7          ;Set scan port to
                    0801                                                         1111 0111
                    0802                                  STA    2800
                    0803
                    0804
                    0805                    READ:         LOA    1800          ;Read columns
                    0806
                    0807
                    0808                                  MVI    B,07          ;Mask off all bits except
                    0809                                                         three LSBs
                    080A                                  ANA B
                    080B                                  CPI 05               ;Is data 101 ("2" key)?
                    080C
                    0800                                  JNZ    READ          ;If not, read again
                    080E
                    080F
                    0810                                  CALL BEEP            ;Yes-generate beep
                    0811
                    0812
                    0813                                  JMP    READ          ;Read again
                    0814
                    0815


                                       Table 14-5.    Program to Test for "2" Key


                                                                                                       Lesson 14
220                                                                                    Practical Microprocessors


## Page 247




_ _ _ _ _ _ _ _ _ EXPERIMENT 14-2
                                                                                            Continued


   B) Verify that the program is correctly stored.
   C) Run the program, and try pressing different keys. Does it act as expected?
   D) Press (RES:) to return control to the monitor. Modify the program to detect the "3" key instead of
      the "2" key (refer to Table 14-3).

   E) Run the modified program and verify that it performs as expected. If you can not make itwork,
      look at the solution in Appendix A.


  SUMMARY

 The keyboard was read by first setting the scan port to select a row and then reading the column
 data. The setting of the scan port disabled all but three of the keys. The exact key that was pressed
 was then determined by comparing the data read from the keyboard with the bit pattern generated
 by the desired key. To detect the "3" key, location OBOC is changed to 03.


Lesson 14
Practical Microprocessors                                                                                  221
      DEBOUNCING    Another factor that must be considered when reading a keyboard is debounc-


## Page 248


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


                    ing. Switches do not, unfortunately, make one clean closure when pressed. They
                    "bounce," as shown in Figure 14-2. When the two metal contacts first touch each
                    other, they rebound and the switch is open again. Then they quickly touch again
                    and bounce again. The same effect occurs when the switch is opened. This
                    bouncing continues for 1-50 ms, depending upon the construction of the switch.

                    Contact bounce is important because it can cause the microprocessor to think
                    that the key was pressed several times, when in fact it was only pressed once. The
                    oscillations at the beginning and end of each pulse must be ignored. This can
                    be done by adding debounce circuits to the input port, or it can be done entirely
                    by software.

                             Key                                                  Key
                           Pressed                                              Released


                       Closed


                         Open


                                H
                                1·50 ms.
                                                                                    H
                                                                                    1·50 ms.


                                                Figure 14-2. Switch Bounce

                    Figure 14-3 shows one way of implementing keyboard debouncing. First the key-
                    board is scanned, using the procedure discussed earlier. If no key is pressed,
                    the process is repeated. When a key depression is detected, the function
                    indicated by the key is performed. The keyboard is then ignored for 50 ms to
                    ensure that the key is not read while it is bouncing. The keyboard is then
                    scanned repeatedly, until the key is released. When the key is released, another
                    50 ms delay is inserted to avoid reading the key during the release bounce period.


      THE DISPLAY   The j..tLab uses a six-digit, seven-segment LED display. Only one digit is on at any
                    instant; the entire display is illuminated by writing repetitively to each digit in
                    turn. This is referred to as refreshing or scanning the display. Each digit is on
                    only one-sixth of the time, but each is flashing so fast that they all appear to be
                    steadily lit. Multidigit displays are usually driven this way because it simplifies
                    the hardware (as described in Lesson 9).

                    The j..tLab's monitor program contains a subroutine called DCD (Display Charac-
                    ter Decoder), which controls the display. To use this program, the digits to be
                    displayed are stored in six memory locations (one for each digit). The program
                    reads the digits from the memory, converts the data to the code required by the
                    display, and then refreshes the display.
                    There is another program that is helpful in creating a display. It is a routine
                    called STDM (Store Display Message), which simply moves the message (the
                    characters to be displayed) from your program to the location in memory where
                    the display routine expects to find it. Using these two routines allows you to easily
                    control the display.


                                                                                           Lesson 14


## Page 249


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



                                  Key Read


                                   Scan
                                  Keyboard


                            No


                                  Perform
                                  Indlcated
                                  Function


                                 Wait 50 ms


                                   Scan
                                  Keyboard


                            No


                                 Walt 50 ms


                 Figure 14-3. Keyboard Debounce Flowchart


Lesson 14
Practical Microprocessors                                                   223
EXPERIMENT 14-3 _ _ _ _ _ _ _ __


## Page 250



Displaying a Message


  CONCEPT

  In this experiment, the routines contained in the JLLab's ROM are used to display a message on the
  seven-segment LED display. The message is set by storing the desired character codes in the memory.


  PROCEDURE

      A) Code and key in the program in Table 14-6. The routine STOM starts at address 0018, and OCO
         starts at address 01 E9.


                  Address       Contents        Label            Instruction              Comments
                   0800                                        LXI     0,0810       ;Set message
                   0801                                                              address
                   0802
                   0803                                        CALL STOM            ;Move message
                   0804
                   0805
                   0806                       LOOP:            CALL OCO             ;Oisplay message
                   0807
                   0808
                   0809                                        JMP     LOOP
                   080A
                   080B

                                        Table 14-6.   Message Display Program


         This program first sets the 0 and E registers to the address where the message starts. The LXI 0
         (load register pair immediate) instruction is used. This instruction loads the E register with the
         first byte after the opcode, and the 0 register with the second byte. Then the STOM routine is
         called, which moves the message starting at the address in 0 and E to the location where the OCO
         routine expects to find it. Finally, the OCO routine is repeatedly executed to refresh the display.

      B) Key in the following data, which constitutes the message:


                                           0810           06         (Right-hand digit)
                                           0811           05         (Second digit)
                                           0812           04         (Third digit)
                                           0813           03         (Fourth digit)
                                           0814           02         (Fifth digit)
                                           0815           01         (Left-hand digit)


                                                                                                      Lesson 14


## Page 251




_ _ _ _ _ _ _ _ _ EXPERIMENT l4-3
                                                                                                   Continued


     C) Run the program at 0800. The message 12:1 '-I           56       appears in the display.

     D) The refresh program can also generate a limited set of alphabetic characters. Table 14-7 shows
        the characters and the corresponding codes. Press (::) to return control to the monitor, and
        change the message data to the following:

                                                  0810         10
                                                  0811         10
                                                  0812         14
                                                  0813         12
                                                  0814         OE
                                                  0815          11
     E) Run the program.

     F) Now make up a message using the characters in Table 14-7. Press (AE~~) to return to the monitor,
        store the appropriate codes in locations 0810-0815, and run the program.

                 Character         Hex Code                  Character             Hex Code -

                     a                  0                            F                  F
                                        1                       (blank)                10
                     2                  2                            H                 11
                     :I                 3
                                                                     ,
                                                                     L                 12
                     '-I                4                            u                 13
                     5                  5                            P                 14
                     6                  6                            0                 15
                     1                  7                            U                 16
                     B                  8                                              17
                     9                  9                            c                 18
                     R                  A                            I                 19
                     b                  B                            8                 1A
                      r
                     (..                C                            r                 1B
                     d                  0                                              1C
                     E                  E

                              Table 14-7. Character Codes for DCD Routine


Lesson 14
Practical Microprocessors                                                                                 225
                                              ,


## Page 252




EXPERIMENT 14-3 _ _ _ _ _ _ _ __
Continued


      SUMMARY

      This experiment used two monitor routines to place a message on the display. The first routine (STDM)
      moved the message to the RAM locations used by the display scan routine. The second routine (DeD)
      translated the character code to the seven-segment code and refreshed the display. Some alphabetic
      characters were also displayed.


                                                                                                   Lesson 14


## Page 253


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



 Write a program to display the value of the pressed key in the right-hand display              PROGRAMMING
 digit. Use the routine KIND (as in Experiment 14-1) to read the keyboard and                   EXERCISE 14-2:
 STDM and OeD (as in Experiment 14-3) to send the data to the display.
                                                                                                USING THE
 Remember that if your program stores data in RAM it must use locations
 0800-0890.                                                                                     KEYBOARD AND
                                                                                                DISPLAY


The display is controlled by two ports, as shown in Figure 14-4. Each bit of the                CONTROLLING
scan port controls one digit, and each bit of the segment port controls one                     THE DISPLAY
segment. Figure 14-4 shows the data format for these ports. To display a
                                                                                                DIRECTLY
message, the characters are first converted to the seven-segment code. Each
digit is then illuminated in turn (by setting the scan port), and the appropriate
segments are turned on to display the desired character.


        SEGMENT CONTROL


                   Segment Port
                                     lo·p·1 g I fie I d I c I b I a I
                                                                                f   ,-,b a


                                                                                    IZI ~D.P.
                   Address 3800

                                                                                e
            For example:                      o        o   0       o   0
            will display a   2
            Data I. active low; 0 turns segment on


        DIGIT CONTROL
                                              Left Hand            Right Hand
                                                Digit                 Digit


                   Scan Port
                  Address 2800
                                     ----  Not
                                           Used    ~                   ~

                                                  I6 I5 I4 I 3 I 2 I 1 I
            For example:               0      0    D   0   0   0   1   0
            will turn on the second digit from the right
           Data Is active high; 1 turns digit on


                                 Figure 14-4. J.l.Lab Display Control


Lesson 14
Practical Microprocessors                                                                                     227
EXPERIMENT 14-4 _ _ _ _ _ _ _ __


## Page 254



Controlling the Display Directly


  CONCEPT

  In this experiment, a "2" is displayed in one digit of the display by setting the scan and segment ports.
  The data sent to the ports is then modified to change the character or the position in which it is
  displayed.


  PROCEDURE
      A) Code and key in the program in Table 14-8. This program first sets the scan port to turn on the
         third digit from the right. The data to generate a "2" is then sent to the segment port.


              Address      Contents       Label        Instruction                Comments
                0800                    START:         MVI A,4        ;Set scan port to select digit
                0801                                                   (4 hex=OOOO 0100 binary)
                0802                                   STA 2800
                0803
                0804
                0805                                   MVI A,A4       ;Set segment port to display
                0806                                                   character "2"
                0807                                   STA 3800
                0808
                0809
                080A                                   JMP START
                0808
                080C


                                         Table 14-8.   Program to Display a "2"


      8) Run the program. The character 2 is displayed in the third digit from the right. Notice that it is
         brighter than the usual display. Normally all six digits are scanned, and each digit is on only
         one-sixth of the time. Now one digit is on all the time.

      C) Press [RESET] to the return to the monitor. Change the data sent to the scan port to 8 hex (0000 1000
         binary). This selects the fourth digit from the right.

      D) Run the program. The character moves one position to the left.

      E) Stop the program and change the data that is sent to the segment port to 98. Referring to Figure
         14-4, try to predict what character this will generate.


                                                                                                     Lesson 14
228


## Page 255




_ _ _ _ _ _ _ _ _ EXPERIMENT 14-4
                                                                                            Continued


     F) Run the program. A new character is displayed. Notice that since each segment is directly
        controlled, new characters can be made up at will.

    G) Press (RESET). Make up a new character (by referring to Figure 14-4), and change the program to
        generate it. Run the program to verify that your character is as expected.


   SUMMARY

   The ~Lab's seven-segment display was controlled directly, without the use of the monitor's subroutines.
   Data was sent to the scan port to select the digit and to the segment port to determine the character.
   Since each segment is individually controlled, new characters can be easily generated.


Lesson 14
Practical Microprocessors                                                                                    229
  SCANNING ALL    The next step towards a complete display control program is illuminating all six


## Page 256



                  digits. As described earlier, this is accomplished by lighting each digit in turn.
     THE DIGITS

                  Since writing to all six digits requires that you write new data to the segment and
                  scan ports six times for each scan, a subroutine to perform this task makes the
                  program much simpler. Table 14-9 shows a subroutine that writes the data in
                  the 8 register to the scan port and the data in the C register to the segment port.


                       Address      Contents        Label         Instruction          Comments
                        0830           3E         OISP:         MVI A,FF         ;Turn off segments
                        0831           FF
                        0832           32                       STA 3800
                        0833           00
                        0834           38
                        0835           78                       MOVA,8           ;Set scan port
                        0836           32                       STA 2800
                        0837           00
                        0838           28
                        0839           79                       MOVA,C           ;Set segment port
                        083A           32                       STA 3800
                        0838           00
                        083C           38
                        0830           C9                        RET


                                             Table 14-9.    Display Subroutine


                  Note that the first step is to turn off all the segments, 50 that the data from the
                  previous digit is not momentarily displayed. If this were not done, the scan port
                  would be set to illuminate the next digit in the sequence, but the segment port
                  would stili contain data from the previous digit.


                  To light all six digits, a program to set the 8 and C registers and call the OISP
                  routine once for each digit is required. Table 14-10 shows the listing for this
                  program. The LXI instruction allows both the 8 and C registers to be set with one
                  instruction, even though they are being used for different purposes. The first byte
                  following the LXI opcode is loaded into the C register. It is the data that is sent to
                  the segment port by the display routine. The second byte is loaded into the 8
                  register and is the digit select data (sent to the scan port). After the 8 and C
                  registers are loaded, the OISP subroutine (Table 14-9) is called. This program
                  controls all six digits of the display without using any monitor subroutines.


                                                                                            Lesson 14
230                                                                         Practical Microprocessors


## Page 257




  Address   Contents       Label        Instruction              Comments
   0800        01       START:        LXI     B,018E      ;Set data for right-hand
   0801        8E                                          digit
   0802        01
   0803        CD                     CALL    DISP        ;Display digit
   0804        30
   0805        08
   0806        01                     LXI     B,0286      ;Set data for 2nd digit
   0807        86
   0808        02
   0809        CD                     CALL    DISP        ;Display 2nd digit
   080A        30
   080B        08
   080C        01                     LXI     B,04A1      ;Set data for 3rd digit
   0800        A1
   080E        04
   080F        CD                     CALL    DISP        ;Display 3rd digit
   0810        30
   0811        08
   0812        01                     LXI      B,08C6     ;Set data for 4th digit
   0813        C6
   0814        08
   0815        CD                     CALL DISP           ;Display 4th digit
   0816        30
   0817        08
   0818        01                     LXI      B,1083     ;Set data for 5th digit
   0819        83
   081A        10
   081B        CD                     CALL DISP           ;Display 5th digit
   081C        30
   0810        08
   081E        01                     LXI      B,2088     ;Set display for 6th digit
   081F        88
   0820        20
   0821        CD                     CALL     DISP       ;Display 6th digit
   0822        30
   0823        08
   0824        C3                     JMP      START      ;Repeat
   0825        00
   0826        08


                       Table 14-10.   Display Scan Program


Lesson 14
Practical Microprocessors                                                              231
EXPERIMENT 14-5 _ _ _ _ _ _ _ __


## Page 258



Scanning the Display


      CONCEPT

      The program described above is entered and run. The entire display appears to be lit simultaneously,
      even though the digits are illuminated one at a time. This illustrates the basic operation of a multiplexed
      display.


      PROCEDURE

       A) Key in the display scan program in Table 14-10.

       8) Key in the DISP subroutine in Table 14-9.

       C) Verify that the programs are correctly stored.

       D) Run the scan program. R b [d          E F appears in the display.

       E) Stop the program and change the message. You need to change the segment data for each digit
          (stored in locations 0801, 0807, O8OD, 0813, 0819, and 001F). Figure 14-4 is helpful in determining
          the seven-segment code for the desired character.

        F) Run the program again to see your message.


      SUMMARY

      A program that displays a message in all six digits was entered and run. While the program produces
      the same result as the monitor's display refresh program, it is less sophisticated. This program
      requires you to specify the message in seven-segment code, and it does not accept a message from
      any point in memory (the message is imbedded in the program). In spite of these differences, this
      program illustrates the techniques involved in display scanning.


                                                                                                       Lesson 14


## Page 259




_ _ _ _ _ _ _ _ _ _ _ _ REVIEW
                                                                                      Lesson 14


The ~L.ab's keyboard and display are scanned by software. The display is driven
one digit at a time, with each digit lit in turn. The keyboard is read one row at a
time. This scanning process is acceptable because the microprocessor can scan
the entire keyboard and display in much less time than it takes a person to
respond.

The keyboard and display are easy to use by utilizing the monitor's routines.
Writing a program to do all the scanning and code conversion without using the
monitor's routines is more complicated, but it allows you to see the detailed
operation of the keyboard and display scanning. It also permits new characters
to be generated.

Most microprocessor-based products have a keyboard and a display. They are
often interfaced using the techniques described in this lesson. Although a
moderate amount of software is required, the hardware is very simple. This is
an example of a function traditionally performed by hardware that can now be
done with software.


Lesson 14
Practical Microprocessors                                                                    233
QUIZ _ _ _ _ _ _ _ _ _ _ __


## Page 260


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


Lesson 14


            1. If both the 2 and 3 keys are pressed, the program in Table 14-5 will:
               a. beep as long as the 2 key is pressed.
               b. beep as long as the 3 key is pressed.
               c. not beep as long as the 3 key is pressed.
               d. beep as long as either key is pressed.


            2. If a key switch that bounces for 75 ms is used with the debounce program of
               Figure 14-3, the system:
               a. will debounce the key correctly.
               b. might see one press of the key as two.
               c. might see one press as three or more.
               d. will think a different key has been pressed.


            3. The display is illuminated:
              a. one segment at a time.
              b. one digit at a time.
              c. two digits at a time.
              d. all at once.


            4. One function that is performed by the monitor's display scan routine OeD,
               but not by the program in Table 14-10, is:
              a. scanning of all six digits.
              b. control of all seven segments.
              c. conversion to seven-segment code.
              d. keyboard debouncing.


                                                                                 Lesson 14


## Page 261




_ _ _ _ _ _ LESSON 15
                                                      Number Representations
                                                              and Algorithms


Microprocessor-based systems are often used to perform elaborate mathematical       INTRODUCTION
functions on a wide range of numbers, as in electronic calculators. However, the
programs which have been used in this course are limited to positive integers
between a and 255, and the functions are limited to simple logic, addition, and
subtraction. This lesson discusses the techniques used to represent a wider
range of numbers and perform complex mathematical operations.


Consider the problem of representing both negative and positive integers using      NEGATIVE NUMBERS
an eight-bit word. Since there is no way to represent more than 256 different
numbers using eight bits, the range is limited to about ±127. The first 128
numbers, zero through 127 (7F hex), are defined as positive numbers. Negative
numbers are generated by counting "backwards" from zero. Like a hardware
up/down counter, if a register is at 0000 0000 and is decremented, the next count
is 1111 1111 (FF hex). FF hex is therefore the representation for -1. This repre-
sentation is called two's complement. Table 15-1 shows the two's complement
representation for -8 through +7.

                     Decimal         Two's Complement
                         7                0000 0111
                         6                0000 0110
                         5                0000 0101
                         4                0000 0100
                         3                0000 0011
                         2                0000 0010
                         1                0000 0001
                         a                0000 0000
                        -1                1111 1111
                        -2                1111 1110
                        -3                1111 1101
                        -4                1111 1100
                        -5                1111 1011
                        -6                1111 1010
                        -7                1111 1001
                        -8                11111000

         Table 15-1. Two's Complement Representation of -8 through +7


Lesson 15
Practical Microprocessors                                                                      235
                  Note that the most-significant bit indicates the sign. If the MSB is zero, then the


## Page 262



                  number is positive. If the MSB is one, then the number is negative.

                  The procedure to calculate the two's complement representation is simple. For
                  positive numbers, the two's complement and binary representations are the same
                  (as shown by the first eight entries in Table 15-1). For negative numbers, the
                  procedure for calculating the two's complement representation is as follows:


                       1. Write the binary representation of the absolute value (e.g., for -5 write
                          0000 0101).

                       2. Complement the binary number (this is called the one's complement,
                          e.g., 0000 0101 = 1111 1010).

                       3. Add one to form the two's complement (e.g., 11111010 + 1 = 11111011 =
                          -5 two's complement).

                  The procedure to get the absolute value of a negative two's complement number
                  is the same: complement the number and then add one.

                  For example, consider the two's complement number 1111 1011:

                       1111 1011 = 0000 0100            0000 0100 + 1 = 0000 0101 = 5

                  Therefore, 1111 1011 is the two's complement representation of negative five.


                  Note that the number 11111011 could also be interpreted as 251 decimal, if it were
                  considered to be straight binary rather than two's complement. It is therefore
                  necessary to define the data as being two's complement and remember to treat it
                  appropriately.

                  The two's complement representation is very convenient for arithmetic. Two's
                  complement numbers, when added, subtracted, multiplied, or divided, yield
                  results in two's complement. It is commonly used in microprocessor systems
                  that must represent both positive and negative numbers.


LARGE AND SMALL   While two's complement provides a representation for negative numbers, the
       NUMBERS    range is still limited to integers with absolute values of less than 129. This range
                  can be extended in several different ways, depending upon how wide a range is
                  required and the degree of precision needed.

                   Double Precision
                  The simplest technique for extending the range of numbers that can be
                  represented is simply to increase the number of bits used to represent each
                  number. This is often done by using pairs of words to represent a single number
                  (see Figure 15-1). With the 8085, this can be done using the register pair instruc-
                  tions, which operate on sixteen bits at a time. Using two words for one number is
                  called double precision. With an eight-bit processor, this extends the range to
                  zero to 65,535, or ±32,767.


                                                                                         Lesson 15
 236                                                                     Practical Microprocessors


## Page 263


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



            M                                                                                 L
            S                                                                                 S
            B                                                                                 B
            .1____M_o_s_t~_I_g_nl_fl_ca_n_t_B_~_e____I.I____Le_a_s_t~_1~g_nl_f~__.n_t_B~Y_te__~1

                                  Figure 15-1. Double Precision

 Fixed Point
Double precision extends the range of magnitudes, but what about numbers less
than one, or between 3 and 4? Figure 15-2 shows a representation called fixed
point. In this example, two bytes are used to store the number. The first byte is
defined as being to the left of the decimal point (actually a binary point), and the
second byte is the fractional part (to the right of the binary point). This allows
numbers as small as 2-8 = 11256 to be represented, as well as fractional numbers
such as 3.17. The resolution, however, is limited to 1I256th (about .004) and the
range is limited to ±127.


                                          Implied Binary Point


        r,----,n-te-g-er-p-art---.....             drl---F~r-act~lo-na~l~p~a-rt--             .....


                                      Figure 15-2. Fixed Point


 Floating Point
Fixed point can be extended by using multiple bytes for each part of the number,
but, unless a large amount of memory is dedicated to each number, it is still
incapable of representing numbers such as 360,000,000,000 or 0.000000297. Note
that these numbers contain many zeros, which are used as "place holders." These
numbers can be easily represented by using "scientific notation," or mantissa and
exponent. The mantissa is the magnitude of the number, adjusted to between
zero and one. The number 360,000,000,000 for example, can be written as
0.36 x 1012 (0.36 is the mantissa and the exponent is 12), and .000000297 can be
written 0.297 x 10-6 (0.297 is the mantissa and -6 is the exponent).

Suppose, then, that two bytes are used to represent each number as shown in
Figure 15-3. One byte is the mantissa, and the other is the exponent. The range of
values that can be represented, assuming that both the mantissa and exponent
are stored in two's complement form, is about ±10±127. This is a very large range;
10127 is quite a large number, and 10-12 7 is very small.


        I                Mantissa
                                                       I               Exponent


                                    Figure 15-3. Floating Paint


Lesson 15
Practical Microprocessors                                                                             237
                  This technique, called floating point, is commonly used for representing a wide


## Page 264



                  range of numbers. More than two bytes are often used to obtain greater resolution
                  (more digits in the mantissa).

                  Note that, as with all representations, the type of representation must be known
                  in order to decipher the number. The same two bytes of data could be very
                  different numbers if interpreted as a pair of two's complement numbers, a single
                  fixed point number, or a floating point number. The software that operates on
                  the numbers must know which representation is used.


DECIMAL NUMBER    Most microprocessor systems have decimal 110 devices, such as keyboards and
 REPRESENTATION   displays. (The I1Lab is an exception, since it uses hexadecimal.) Since decimal is
                  the natural form for most people, most microprocessor systems must accommo-
                  date it.

                  The problem is how to represent decimal numbers in the binary-oriented
                  processor system. Suppose, for example, that the decimal number 28 is read from
                  a keyboard. The number can be converted to its binary equivalent, 0001 1100
                  (1C hex). However, if this number is to be displayed on a decimal display, it must
                  be converted back to the two decimal digits, 2 and 8.

                  An alternative method is to take each of the decimal digits, 2 and 8, and convert
                  them independently to two four-bit binary numbers. The two four-bit numbers
                  are then packed into one byte. Thus, 28 would be coded as 0010 1000. This is
                  called Binary Coded Decimal (BCD). Note that the binary values 1010 through
                  1111 are never used in the BCD representation.

                  BCD is commonly used in systems that utilize decimal 110, since it avoids the
                  decimal-binary conversion process. One disadvantage is that it is inefficient in
                  terms of storage space. The largest decimal number that can be stored in a byte
                  using BCD is 99, whereas in pure binary it is 255. Arithmetic is also awkward in
                  BCD, since it is not a "natural" number system. However, most microprocessors
                  provide special instructions for accommodating BCD. (See the description of the
                  DAA instruction in Appendix B.)


 REPRESENTING     Many microprocessor systems must operate not only on numbers, but also on
ALPHANUMERICS     letters. For example, a computer terminal must read the characters from the
                  keyboard and send them to the computer. Letters must somehow be represented
                  by binary numbers.


                  The most common code for doing this, called ASCII (American Standard Code
                  for Information Interchange), is shown in Table 15-2. Every character is assigned
                  a binary value. Note that, as with all representations, the context of the informa-
                  tion is important. For example, 0101 0100 may be the binary representation of the
                  decimal number 84, the BCD representation of 54, or the ASCII character ''T.'' The
                  codes in the shaded areas are control codes, which provide special functions.
                  The code "OA," for example, is used to cause a line feed on a printer or display.


                                                                                        Lesson 15
238                                                                     Practical Microprocessors


## Page 265


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



                          20    SPACE          40    @               60
                          21                   41    A               61    a
                          22                   42    B               62    b
                          23    #              43    C               63    c
                          24    S              44    D               64    d
                          25    0/0            45    E               65    e
                          26    &              46    F               66    f
                          27                   47    G               67    9
                          28                   48    H               68    h
          NT              29                   49    I               69    I
          LF              2A                   4A    J               6A    J
          vr              2B    +              4B    K               6B    k

         "
         CIt
         10
                          2C
                          2D
                          2E
                                               4C
                                               4D
                                               4E
                                                     L
                                                     M
                                                     N
                                                                     6c
                                                                     6D
                                                                     6E
                                                                           I
                                                                           n
                          2F    I              4F    0               6F    0
                          30    0              50    P               70    P
                          31    1              51    a               71    q
                          32    2              52    R               72    r
                          33    3              53    S               72    s
                          34    4              54    T               74    t
                          35    5              55    U               75    u
                          36    6              56    V               76    y
                          37    7              57    W               77    w
                          38    8              58    X               78    x
                          39    9              59    Y               79    Y
                          3A                   5A    Z               7A    z
                          3B                   5B    I               7B
                          3C    <              5C     \              7C
                          3D                   5D    I               7D
                          3E    >              5E    1\              7E
                          3F    ?              5F

                                            SHADED CODES ARE CONTROL CODES


                               Table 15-2. ASCII Codes


The assignment of codes to characters is arbitrary, and there are many other
possibilities. ASCII is currently the most widely used code, but another code
called BAUDOT was very popular in the past. IBM machines use EBCDIC
(Extended Binary Coded Decimal Interchange Code) .


A common programming problem is the conversion of one number representa-                TABLE LOOK-UP
tion or code to another. For example, consider the problem of displaying a
hexadecimal digit on a seven-segment display. It must somehow be determined
wh ich segments to turn on to display the appropriate character. A conversion
from binary to seven-segment code is required .

This is done using a techn ique called table look-up. The segment patterns for
each character are stored as a list in memory called a table. The first entry con-
tains the segment pattern for the character "0, " the next for the character "1," and
so on. To translate a binary code to the corresponding seven-segment code, the
code is simply "looked-up" in the table.


Lesson 15
Practical Microprocessors                                                                           239
                Figure 15-4 shows the flowchart for a program that converts binary data to


## Page 266


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


                seven-segment code. This program uses a table of seven-segment codes. The
                first entry in the table contains the seven-segment code for zero, the next entry
                the seven-segment code for one, and so forth. First, the binary number to be
                converted is added to the address of the first entry in the table. The result is the
                address of the table entry containing the desired seven-segment code. The con-
                tents of the addressed location are then read, and the conversion is complete.


                                  Add binary
                                code to start-                                Table
                               of-table address
                                                                     Seven·Segment Code for 0
                                                                     Seven· Segment Code for 1
                                                                     Seven·Segment Code for 2


                                 Get contents
                                  of address
                                just calculated                      Seven·Segment Code for F


                       Figure 15-4. Table Look-Up for Binary to Seven-Segment Conversion

 MATHEMATICAL   You may be wondering at this point how any really complicated functions can be
  ALGORITHMS    performed with only this basic set of instructions. Calculators, which use micro-
                processors, perform division, multiplication, sine, cosine, and many other mathe-
                matical functions. Yet the direct arithmetic capabilities of the 8085 microprocessor
                (and most other eight-bit processors) are limited to addition and subtraction.

                Complex mathematical functions are in fact performed (or approximated very
                closely) using only the simple add and subtract instructions. Multiplication can
                be performed very simply by a series of additions and shifts. To see how this is
                done, consider how you multiply "by hand." The multiplicand is multiplied by one
                digit of the multiplier at a time. The result from each successive digit of the
                multiplier is shifted left one place, and all the results are added. The same
                technique can be used for binary numbers. Multiplication by one digit is
                trivial: a number multiplied by one is the original number, and a number mUlti-
                plied by zero is zero (see Figure 15-5). The entire multiplication can therefore be
                performed using only shifting and adding. A similar process performs division
                using shifting and subtraction. Techniques for performing a given operation are
                called algorithms.


                                                                                       Lesson 15
240                                                                    Practical Microprocessors


## Page 267


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



                                          1 0 1 1
                                x         1 0 0 1

                                          1 0 1 1
                                      o0 0 0
                                    000 0
                                1 0 1 1

                               1100011

                          Figure 15-5. Binary Multiplication


Calculating a function such as the sine of an angle is more complicated, but there
are algorithms to approximate the sine function very closely using only simple
functions. For example:


  sin X
                                           X7          +           X9
                                     7X6X5X4X3X2           9X8X7x6X5x4x3X2


This is an infinite series, which will give an exact value for the sine of an angle if
it is carried out for an infinite number of terms. Multiplication and division are
used, but they can be performed using the addition and subtraction instructions.

In practice, of course, only a finite number of terms may be calculated. This
causes the result to be an approximation, but it is very accurate if a large number
of terms are calculated (which is no problem for a microprocessor).

The series described above provides an algorithm for calculating the sine of an
angle. For every mathematical function, there is an algorithm that allows the
function to be calculated using only the elementary operations that a micro-
processor can perform.


Lesson 15
Practical Microprocessors                                                                241
REVIEW _ _ _ _ _ _ _ _ _ _ __


## Page 268



Lesson 15


            Using the standard binary number system, eight-bit processors are limited to
            integers between zero and 256. Negative numbers can be represented using two's
            complement, which assigns half the values to positive numbers and half to
            negative numbers.

            Larger numbers can be represented in several ways. The simplest is double
            precision, in which two bytes are used for each word of data. This provides
            sixteen bits for each word, giving a range of zero to 65,535. For an even
            greater range, floating point is used. One byte is used to represent the mantissa
            and another for the exponent. Fixed point is another representation that uses one
            byte for the integer part and one for the fractional part.

            BCD is a way of representing numbers in a form that is convenient for decimal
            input and output. Each decimal digit is converted separately to a four-bit binary
            number.

            To represent alphanumerics, each character is assigned a binary code. ASCII is
            currently the most popular code.

            Complex mathematical functions are performed using algorithms. Any function
            can be approximated (if not calculated exactly) by a series of additions and
            subtractions.


                                                                                Lesson 15
242                                                             Practical Microprocessors


## Page 269




_ _ _ _ _ _ _ _ _ _ _ _ QUIZ
                                                                              Lesson 15


1. 1111 0001 is the two's complement representation of:
  a. F1 (hex).
  b. -F1.
  c. OE.
  d. -DF.


2. For a processor that uses four-bit words, the largest number that can be
   represented using double precision is:
  a. 15 (decimal).
  b. 255.
  c. 127.
  d. 65,535.


3. The greatest range of numbers is obtained using the - - - - - - - - -
   representation.


4. BCD is used because:
  a. decimal I/O is simplified.
  b. calculations are simplified.
  c. memory is used more efficiently.
  d. complex arithmetic functions can be performed.


5. Complex mathematical functions are performed by microprocessors:
  a. using special instructions designed for the function.
  b. using algorithms based on addition and subtraction.
  c. only by using special calculator chips.
  d. only if the processor is specially designed.


Lesson 15
Practical Microprocessors                                                            243
    THIS


## Page 270



    PAGE
    LEFT
   BLANK

    By




## Page 271




_ _ _ _ TROUBLESHOOTING
         MICROPROCESSOR
                 SYSTEMS
                            In 1979 it was estimated that there were 10 billion digital ICs in nonconsumer
                            products worldwide. If their average failure rate is .1% per year, then 10 million ICs
                            die every year. If the average repair cost is $100 per failure, then $1 billion dollars is
                            spent annually on field service.This amounts to 10 cents spent per IC per year on
                            repairs. The maintenance cost over the life of the product can actually exceed the
                            average selling price of the IC! Clearly, efficient testing and repair techniques can
                            result in substantial cost savings.

                            Microprocessors can provide products with improved reliability, performance,
                            features, and sophistication. But with these improvements come new service,
                            troubleshooting, and repair problems. New tools and techniques are required to
                            deal with the failures that can occur in these complex microprocessor systems.

                            In Lessons 16 and 17, the tools that are used to troubleshoot microprocessor-
                            based systems are discussed. These include the logic probe, logic pulser, current
                            tracer, signature analyzer, logic analyzer, and oscilloscope. Then in Lesson 18
                            microprocessor troubleshooting theory and the fault-finding process are de-
                            scribed. Finally, in Lesson 19 these tools and techniques are used to troubleshoot
                            faults in the I-LLab.

                            For the student already familiar with probes, pulsers, and current tracers, it may
                            be desirable to read Lesson 16 lightly. Likewise, Lesson 17 can be read lightly if the
                            student has had prior experience with signature and logic analyzers.


Lesson 16
Practical Microprocessors                                                                                         245
    THIS


## Page 272



    PAGE
    LEFT
   BLANK

    By




## Page 273




-----_LESSON 16
                                                                         Hand-Held
                                                               Troubleshooting Tools


Logic probes, logic pulsers, and current tracers are self-contained tools designed     INTRODUCTION
to stimulate and detect digital activity in logic circuits. Although internally com-
plex, they are easy to use. These three instruments are very effective in a broad
range of digital troubleshooting situations. The experiments that follow illustrate
how they can be used individually and in combination to help locate faults in
microprocessor-controlled digital circuits.


Lesson 16
Practical Microprocessors                                                                         247
EXPERIMENT 16-1 _ _ _ _ _ _ _ __


## Page 274


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


Logic Probes


      CONCEPT
      Logic probes monitor in-circuit logic activity. By means of simple lamp indicators they tell you the logic
      state of a digital signal and allow brief pulses to be detected . In this experiment, the logic signals of the
      ,uLab are used to demonstrate the use of the HP 545A Logic Probe and show how it can be used for
      trou bleshooti ng.


                                                  HP 545A Logic Probe

      PROCEDURE
      I.   Setting-Up the Logic Probe

           A) Be sure that the ,uLab is turned on and that the display shows u L R b          UP . If not, check
              the power switch and press     (=) .
           B) Connect the two power leads of the logic probe to a power supply having the same voltage as
              the logic circuit being tested . The logic power supply of the instrument under test can be used
              if it can supply the additional current required by the logic probe (70 mA) . Power is connected
              by means of the spring-loaded connectors provided with the probe or by direct insertion onto
              the power pins of an IC test clip installed on an IC in the instrument under test (see Figure 16-1).


                              Figure 16-1.   Probe Power Connection Using IC Test Clip


                                                                                                          Lesson 16


## Page 275


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



_ _ _ _ _ _ _ _ _ EXPERIMENT 16-1
                                                                                              ( Continued)


        C) Figure 16-2 shows how the metal "grabbers" at the end of the spring-loaded connectors can be
           inserted through a pair of holes in the /-LLab power slots, one with a large hole and one with a
           small hole. These slots are located along the top edge of the Microprocessor Lab's circuit
           board . Connect the probe power cable with the red wire in it through a pair of holes in the right
           (+5) slot, and the cable with the black wire in it through a pair in the left (Q ) one. Notice that
           the lamp at the tip of the probe glows dimly. This is the "floating" or bad level indicati on.


                     Figure 16-2.   USing "Grabbers" to Get Power from IlLab 's Power Slots

        D) The slide switch on the probe sets the tip input logic thresholds for either CMOS or TTL levels.
           In the CMOS position these thresholds vary as a function of the power supply voltage. In the
           TTL position they are fixed . Be sure that the switch is in the TTL position when troubleshooting
           the /-LLab and most other 5 volt microprocessor systems. Even though they use MOS parts,
           most are designed to have TTL voltage thresholds at the pins.

  II.   Using the Probe

        A) The lamp at the tip of the probe provides logic state information . Observe that with the metal
           probe tip not touching anything , the lamp is dimly lit, indicating the floating node or bad level
           condition. Each point in the circuit is called a node. All points that are wired directly together
           are part of the same node. If this indication (the dimly lit lamp) is present on an actual logic
           node, it means that a nonvalid logic level is present (between the "0" and "1" logic thresholds, as
           shown in Figure 16-3). If this node were a three-state bus line with all bus device outputs
           disabled (turned off) or perhaps the open input of a gate, a floating level might be acceptable.
           But if a floating level indication is present on a node where there should be a logic output , there
           is a problem.


Lesson 16
Practical Microprocessors                                                                                         249
EXPERIMENT 16-1 _ _ _ _ _ _ _ __


## Page 276


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


( Continued)


                                       5V


                                                      BRIGHT        Logic 1
                                      2.4V


                                                                   Bad
                                                      DIM          Level (Floating)


                                      .BV

                                                      OFF           Logic 0
                                        0


                           Figure 16-3. TTL Voltage Threshold for 545A Logic Probe

      B) Check the probe by touching the tip to the ground slot. The light near the tip goes out,
         indicating a logic 0 level. Now touch the tip to the +5 slot. The lamp gets brighter, indicating a
         logic 1 level.

      C) Use the probe to verify signal continuity between input port IC13-18 and the input port switch
         for the D7 line (located just bel ow the right-most display module , as shown in Figure 16-4).
         Place the probe ti p on IC13-18 and slid e the left-most input switch (i nput 7) up and then down.
         Observe that the light follows the logic level change. Note that both the schematics and the PC
         board use the character "U" to designate ICs.


                                    Figure 16-4.   Input Port Switch for /-LLab

      D) Referring to the schematic in Figure 16-5, probe IC18-12. This is a keyboa rd input line. Observe
         the constant bright light. It tells you that this signal is a steady log ic 1. This is true because no
         keys in th e O-D key column (0,1 A ,7,A, D ) are bei ng iilput to the microprocessor.

      E) Now probe all li nes on the output side of scan port 1C17 (see Figure 16-5). The flashing light
         indicates that th ere is rap id logic activity on all of these lines. The logic probe slows down the
         lamp blink rate so that you can see it. If one of these lines is inactive, this condition will become
         readily apparent when you use the logic probe.


                                                                                                        Lesso n 16


## Page 277


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



--------_EXPERIMENT 16-1
                                                                                                                                                                                           ( Continued)


                                                 I 20

                                  ~li    ENl 8!LS95
                                         EN2 U!4                          / - - - - - - - - DATA LED ' S - - - - ,

                                           3-ST ATE
                                           BUFFER                                   T
                                                                                        BufFERED DA TA BUS
                                                                                             •5            3   ,                           2    I     ~
                              ~ INS               OUTe~                      DS5                                       os.
                              tc--1:     INI
                                         IN2
                                                    rt--~
                                                  OUTI
                                                  OUT2~
                              ~~         IN3      OUT3~                             ~ ;f.                      J.                    ".
                                                                                             j.   j       .


                              ~
                                         IN4
                                         INo
                                                  OUT 4 ~
                                                  OUT5 ~
                                                                                  ,, ~/\    r \; r \; r                     ~ r ~ r~ r \; ~
                              ~
                              ~8"        INS      OUT6 ~
                                         IN7      OUT1~
                                                -&'0
                                                                                                                      -&                   KEY INPUT
                                                                                                                             ~BUfFER~
                                                                          +5VII )                                    FROW
                                                             +5V(2)


      r     unFROW
                10)
                      NSCAN
                                  I"
                                   G     R
                                          C
                                           74LS273
                                             UIT
                                                  20


                                                                      I
                                                                      10K
                                                                      R5
                                                                              I
                                                                               I


                                                                                     H        G       F
                                                                                                                     UII (8)
                                                                                                                     NK~
                                                                                                                       I.
                                                                                                                                          112 8 1LS9r

                                                                                                                                          EN UI88
                                                                                                                                            3-STATE
                                                                                                                                                                                                 RJ
                                                                                                                                                                                                lOOn.
                                                                                                                                                                                                             13   y;:   12

                              ~ 0'
                                            REG
                                                                                                                       ,                   BUFFERED                                                     +!   C1217
     SCAN
   REGISTER
                              ~       ~ 0D21
                                                        Ql!~
                                                        QI~
                                                                               10
                                                                                     •        8       T                         12
                                                                                                                                          I'"   oure ~                                                  ~ 3.3UF

                                                        Q2~
                              8 ,~                                                                                     I
                                                                                                                                                OUTI ~


                                                        Q3~                                                                     "         INI
                                D3
                                04                      Q4~                                                            2        I.
                                                                                                                                                          ~
                              ~ 05                      Q5~
                                                                                                                                          IN2   OUT2

                              ~ 06                      Q6~
                                                                                                                                                          ~
                                                                                                                       3        18
                              ~ DT                      QT     19                                                                         IN3   OUT3

                                                -&'0


                                  r - - DIGH DRIVER ~
                                                                                                                                                                                 5 15     520            525
                                               SC AN BUS                                                                                                                        [I]      IIJ             [D
                                           +5V!{~:                                                                                                                            ~ ~                       -70        7
                                                                                                                                                                                5 1.      521            526       "-
                                                                                                                                                                                         UJ
                                                                                                                                                                                                        ~ •
                                         754 92    U20
                                                                                            r - - CONTROL BUFFER --....                                                         QJ
                                  ~ IN'           OUTS
                                                             H                                                  +5VI(;~                                                       ~         bci.
                                  ~ IN(
                                                              ~
                                                                                                                                                                                SIT       522            527
                                                  OUll

                                                                                                                                                                                        3,              ~ •
                                                                                                              1/2 B ILse7                                                       [IJ
                                  ~ IN2                                                                                                                                       --7'2.
                                                  OUT2
                                                              ~
                                  ~ IN3                                     ~~~8)~ EN 3~~~~TE                                                                                                            S28
                                                        ~
                                                                                                                                                                                5 (8      523
                                                  OUT3
                                                                                                                     BUFFER                                                     II]      m              -!:Q
                                  ~      IN_      DUH
                                                        ~                   ~~~Il~                            I N~         DUH' ~                                             -7'2.     ~                          4

                                  U      INS      OU1 5
                                                        ~                   ~~~~2) ~ INI                                   OUT!      ~                               5 1.       5(.       52.            52.

                                                                                                                                                                                                        ~
                        ALL OUTPUTS O.C.~4
                                                                            F~~4 )~ IN2


                                                                                            ~ 'V L~R
                                                                                                              I N3
                                                                                                                           OUT 2

                                                                                                                           OUT3

                                                                                                                           'D
                                                                                                                                     -"--~

                                                                                                                                                             1
                                                                                                                                                      SCAN BUS
                                                                                                                                                                 2,lQ

                                                                                                                                                                  L--
                                                                                                                                                                              ~'2. ~                               3


                                                                                                                                                                                                                   ./
                                                                                                                                                                  KEYBOA.RD
   NOTE NX =X


                                               Figure 16-5.                 Key Input and Scan Circuit for 0-0 Key Column


Lesson 16
Practical Microprocessors                                                                                                                                                                                                    251
EXPERIMENT 16-1 _ _ _ _ _ _ _ __


## Page 278



(Continued)


          F) Now go back to IC18-12 again. While probing this pin, press any of the keys in the 0 through D
             column and observe the flashing light. This tells you that the signal is being switched through
             the keys. Pressing keys in the other columns does not cause activity on this line because they
             are not connected to it. Try a few.

          G) Now probe IC18-19, the key input port select signal. Activity (a flashing light) means that this
             device is being enabled and is monitoring the keyboard. This is true because the monitor
             program is running and is reading the keyboard, looking for a new command.


      CHECKPOINT
      What does the logiC probe tell us?

           • Scan port IC17 is showing activity on its clock input and its outputs. The presence of activity on
             the outputs of IC17 indicates that it is probably functional. Activity on its clock input indicates
             that the circuits generating this signal are operating.
           • Key input port buffer IC18 is enabled by the port select signal coming from the address de-
             coding circuit.
           • The keys in column O-D are all operating properly as switches and are providing a signal to
             IC18-12.
      How useful this knowledge is to you depends on the activity you observe at other nodes and how well
      you understand the system.

      III. Probing Nodes

          A) Using the schematic at the back of the book for reference, probe other nodes in the circuit.
             Compare the results to what you expected based on your knowledge of the JLLab and the
             monitor program. Test the buses, chip select pins, input and output ports, and the control cir-
             cuits. You will find that these circuits are very active.

          B) Now probe 1C10-9 (see Figure 16-6). This is the single-step control bit. A logic 0 level on this line
             indicates that the JLLab is not in the hardware single-step mode.

          C) Press the t~T~H) key on the JLLab to fetch and display an address.

          D) Press (~~::)and observe IC10-9 change to a logic 1. This level indicates that the JLLab is now in
             the hardware single-step mode.

          E) Now probe IC10-5. A low level on this line going to the Ready input (IC3-35) causes the activity
             on the buses to stop.


                                                                                                       Lesson 16
252                                                                                    Practical Microprocessors


## Page 279


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



_ _ _ _ _ _ _ _ _ EXPERIMENT 16-1
                                                                                                                                        ( Continued)


                                                             _t-----'N~IN~
                                                                         S TR-'----'I j
                                                                             AR~SS
                                                                             SE TSS

                                                                   ,----~I .. +5V ( I }

                                                                   ~ ~/2 74 L S 7 ~ ~ ss
                                                                   ~ c            Ut OS
                                                               '-----~ R              FF
                                                                   ~ s


                             R3                                            1/ 2704 LSH
                             IOOl\             !;:12F        +5V ( I ) --} D         Q 2-
                                         13 .J :::::"   12               3    CUI 01.
                                     +~ c I 2 17                         I   R        FF
                                       T 3 . 3UF                   ~ S
                            FROM
                         U3(30)
                                       V 3 U 12B ..
                                     ALE                           L-===='---W
                                                                 NALE.                +5V
                                                                 TO U2 ( I ~~ -2B      JtREERUN


                                                                             ~EPSS                        STE P   TO
                                                                                                   3'J            P1 (X) and U3 135 )
                                                                                                         R58
                                                                                                         10K

                                                                                                  ~V (I )


                                        Figure 16-6.                 Single-Step Control Circuit


      F) Re-probe some of the nodes examined before and verify that most of the activity of the ,uLab is
         frozen . The only active logic node in the system is the clock signal on pin 37 of IC3.

      G) With the probe tip on IC1D-5, press [~~~;) and observe the probe bl ink once per key press.
          Although this pulse is only a few microseconds long , it appears much longer because the
          probe stretches the pulse to a length you can see.

      H) If you press [~~) and observe pins 1,3, and 5 on IC10, you can follow the logic signals for the
          single-step function (refer to Lesson 10).

       I) Now probe one of the data bus lines and press [~~~:) . Observe that even when no logic
          state change occurs, the probe may blink. It blinks because address bus information is multi-
          plexed on the data bus between machine steps. This happens so that the next address can be
          latched by IC2 when the ALE line goes high (refer to Lesson 10) .

       J) Probe IC2-11 (the clock input to the address latch ). As you press [~~~:) , verify that the
          inverted Address Latch Enable line (ALE) pulses.


Lesson 16
Practical Microprocessors                                                                                                                        253
EXPERIMENT 16-1 _ _ _ _ _ _ _ __


## Page 280



( Continued)


      IV. Pulse Memory

      The pulse memory feature of the logic probe is useful for capturin g one or more pulses (or glitches) at
      times when it is not convenient for you to be looking at the probe tip. It is used when a pulse happens
      very infrequently or when the point you need to probe is hard to see.


                                                 •    B    2   ii, ;:-----'
                                                 ::   -5   ,      ' !L.---I

                                            ~


                          Voltage Threshold Selector and Memory Display on Logic Probe


          A) While still in the hardware single-step mode, probe IC10-5 and press the MEM CLR button
             on the logic probe. Observe that the memory light turns off, The pulse memory has been
             cleared. Keep the probe tip on pin 5.

          B) Observe the MEM indicator as you press (~~~:). The indictor lights to sh ow that a pu lse has
              occurred . Additional pulses have no fu rther effect. When using the memory, be sure that the
              probe tip remains in constant contact with the node so that the memory latch will not be set by
              electrical contact noise.


      SU MMARY

      The logic probe is a self-contained , easy-to-use tool fo r examining log ic nodes, You used the probe to
      verify logic continuity, signal flow, address decoding, cl ock, switch, and bus device act ivity. You also
      used it to check the M icroprocessor Lab's operating characteristics in the hardware single-step mode.


                                                                                                       Lesson 16


## Page 281




