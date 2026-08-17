# Practical Microprocessors

- Source PDF: `docs/Practical Microprocessors.pdf`
- Category: `microprocessor-lab-handbook`
- Printed: `March 1979`
- Pages: `161-200 of 484`
- Conversion: `pdftotext` with page markers
- Figures: `docs-classified/reference/practical-microprocessors-p161-200/figures`
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

## Page 161


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.




_ _ _ _ _ _ _ _ _ EXPERIMENT 9-1
                                                                                           (Continued)


          ROM SELECT                                                             1V/ div
            (IC7-15 )


                                                  1 p.s/ div

                     Figure 9-10.    ROM Select Signal with Monitor Program Running


          RAM SELECT                                                             1V/ div
            (IC7-14 )


                                                   1 p.s/ div

                      Figure 9-11.   RAM Select Signal with Monitor Program Running


Lesson 9
Practical Microprocessors                                                                           135
EXPERIMENT 9-1 _ _ _ _ _ _ _ __


## Page 162


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


( Continued)


       J) Examine the KYRD (keyread) select signal (IC7-12). Turn the sweep speed down to 50 J.Ls/ div. By
          carefully adjusting the trigger level, you should get a display like the one shown in Figure 9-12.
          The sequence of eight short pulses is the scanning of the eight rows of the keyboard. The fre-
          quency of this signal is lower than the memory selects because many instructions from memory
          are executed between each key read.


            KYRD SELECT
              (IC7-12 )                                                                 1 V/div


                                                    50 J,ls/ div

              Figure 9-12. KYRD Select Signal with Monitor Program Running (Fast Sweep Speed)


      K) Turn the sweep speed down to 2 ms/div. Verify that the display is similar to Figure 9-13. The
         groups of eight pulses are now blurred and appear as single pulses. Notice that they occur
         relatively infrequently. This happens because the monitor program reads the keyboard once and
         then refreshes the display (which takes much longer).


      L) Examine the SCAN select signal (IC7-10). Try viewing it at several different sweep speeds. Figure
         9-14 shows the display obtained at 200 J.Ls/div. This signal is low each time the keyboard is read or
         data is sent to the display.


                                                                                                      Lesson 9


## Page 163


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



_ _ _ _ _ _ _ _ _ _ EXPERIMENT 9-1
                                                                                          ( Continued)


          KYRD SELECT                                                            1V/div
            (IC7-12 l


                                                 2 ms/ div

            Figure 9-13. KYRD Select Signal with Monitor Program Running (Slow Sweep Speed)


         SCAN SELECT                                                            1V/div
           (IC7-10 )


                                                200 p.s/div

                     Figure 9-14.   SCAN Select Signal with Monitor Program Running


Lesson 9
Practical Microprocessors                                                                          137
EXPERIMENT 9-1 _ _ _ _ _ _ _ __


## Page 164


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


( Continued)


      M) Examine the DSP (display) select signal (IC7-7). This signal is low each time data is sent to the
         display. Figure 9-15 shows the display obtained at 200 J-Ls/div.


                              ....-
                                                                           II


                              --;:


            DSP SELECT                                                              1 V/ div
              (IC7-7 )


                                                  200 J.Ls / div

                         Figure 9-15. DSP Select Signal with Monitor Program Running


  SUMMARY
  Device select waveforms were examined. first while a short loop was running. and then when the
  relatively long monitor program was running. The short loop allowed easy examination of the wav&-
  forms and analysis of the timing. When the monitor program is running. however. the signals can be
  very difficult to view. Operations such as reading the keyboard take only about a microsecond but are
  performed only once every ten milliseconds. Short pulses. widely spaced. are common waveforms
  for device select signals.


                                                                                                    Lesson 9
138                                                                                Practical Microprocessors


## Page 165


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



 All of the I/ O functions on the }.LLab are performed using standard TTL parts. In         PERIPHERAL
 other systems, a large variety of large-scale integration (LSI) I/ O ch ips are com-       INTERFACE CHIPS
 monly used to simplify many interfacing tasks, reduce component count, and
 increase system cost-effectiveness.

 One of the simplest of these chips is the Parallel Peripheral Interface, or PPI (also
 called PIO, for Parallel Input Output). One version of such a part is a forty-pin IC
 that contai ns three I/ O ports (see Figure 9-16). Each of the ports is used either as
 an input or output port. The direction of each port is controlled by a control
 reg ister on the ch ip. An initialization program , contained in the system's ROM ,
 sets this control register to select the desired combination of input and output
 ports.


                  I - --- - - -                 -     -        -    - ---,
                                         'rt-r-                           I
                                                                          I
                                                                          I
                                               A          ~
                                                                   PORT   L       8 LINES
                                                                     A              110
                                               '1         r               I


                                                                    f     I

                           1~                                       ~
                                                                          I
                                                                          I
                                                                          1


                                                          ~
      r Control Bua 1\
         /                CONTROL
                                    A
                                           i A                     PORT           8 LINES

     I                Y
                           LOGIC
                                    '1     I '1           r
                                                                     B
                                                                          I
                                                                                    110


                            t
                                           J                              I
                                                                          I
                                                                    •     I
                                                                          I
                                               A          ..       PORT
                                                                          I       8 LINES
                                                                     C    I         110
                                               '1         r
                                                                          I
                                                                          I
                                                                          I
                                                                          I
         /        I                                                       I
      f- ....... •                 I
                  L ____________ .J

    Figure 9-16. Peripheral Interface Device Containing Three 8-Bit I/ O Ports


These chips have the advantage of providing several ports in one IC. They also
are very flexible, since the nature of each port may be changed by the software.
In addition, they usually include some control -J<59Ic for synchronizing com-
munication and interrupt control.


Lesson 9
Practical Microprocessors                                                                               139
      Another common type of interface chip provides serial inputs and outputs (see


## Page 166


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


      Figure 9-17). These chips are commonly referred to as UARTS (Universal
      Asynchronous Receiver and Transmitter). They accept a byte of data from the
      microprocessor and then output it one bit at a time. They operate much like a
      parallel-in/ serial-out shift register. In addition, start, stop, and other synchronizing
      and control bits can be automatically inserted. The format is controlled by a
      control register similar to the one described for the PPI. UARTS can also handle
      data in the other direction, converting a serial bit stream into a parallel form
      suitable for direct use by the microprocessor. In this mode, they operate much
      like a serial-in/ parallel-out shift register. These devices are also called SIOs
      (Serial Input Output) or ACIAs (Asynchronous Communications Interface
      Adapter).

                         r-------------i

                                                           Receive 1+-..,..--


                                                          RECEIVE                    SERIAL
                                                           PORT                      RECEIVER

                                                                                 )
                                                           Control ~..,..--+


                                                          Transmit 1--"":""--+


                                                                                     SERIAL
                                                                                     TRANSMITTER

                                                                                 )


                                                                       I
                                                                       I
                                                                       I
                                                                       I
                         L ____________ -..l

      Figure 9- 17.   UARTS Provide Serial Communication Interface Between Two Systems


      Serial I/O is most commonly used for communication between a microprocessor-
      based system and a peripheral , such as a CRT or teletype terminal. Since the
      information is in a serial format, only two wires are needed to interconnect
      the devices.

      A wide variety of specialized interface chips is also available, including floppy
      disc controllers, CRT display controllers, direct memory access controllers, and
      keyboard and display controllers. Many of these LSI circuits are even more
      complex than a microprocessor. Some of them use a special-purpose internal
      microprocessor to control their function.


                                                                                     Lesson 9


## Page 167




_ _ _ _ _ _ _ _ _ _ _ _ REVIEW
                                                                                   Lesson 9


There are two main classes of semiconductor memory: RAMs and ROMs. RAMs
can both store and output data. Dynamic RAMs will lose stored data unless they
are continually refreshed, but static RAMs do not need to be refreshed. ROMs can
output only data that has been programmed into them. They are classified by the
method in which they are programmed.

Microprocessor peripherals communicate through I/O ports to the data bus.
Scanning is commonly used to reduce the amount of hardware required for key-
board and display circuits. LSI peripheral interface chips are often used to
simplify system I/O.


Lesson 9
Practical Microprocessors                                                                141
()!   liZ


## Page 168



~rl)! - ----------------------------------------------------------
 Lesson 9


                1. The main advantage of dynamic RAMs over static RAMs is that they are:
                  a. non-volatile.
                  b. easier to use.
                  c. less expensive.
                  d. all of the above.


                2. Dynamic RAMs are best suited to:
                  a. slow systems.
                  b. small systems.
                  c. large systems.
                  d. one-bit systems.


                3. The program ROM found in a high-volume microprocessor-based product is
                   most likely to be a:
                  a. mask ROM.
                  b. PROM.
                  c. EPROM.
                  d. EAROM.


                4. All microprocessor systems need peripherals to:
                  a. interact with the outside world.
                  b. supply data to the microprocessor.
                  c. receive data from the microprocessor.
                  d. do all of the above.


                5. The main advantage of scanning is:
                  a. faster I/O operations.
                  b. a reduction in software cost.
                  c. a reduction in hardware cost.
                  d. all of the above.


                6. When the keys in Figure 9-5 are scanned:
                  a. one key is read at a time.
                  b. one key row is read at a time.
                  c. one key column is read at a time.
                  d. all keys are read at once.


                                                                                      Lesson 9
142                                                                  Practical Microprocessors


## Page 169




_ _ _ _ _ _ _ _ _ _ _ _ QUIZ
                                                                       ( Continued)


7. The speaker can be made to "beep" a tone by executing the:
   a. SIM instruction.
   b. OUT SOD instruction.
   c. BEEP instruction.
   d. BEEP subroutine.


8. LSI peripheral interface chips are used because they:
   a. simplify many interfaces.
   b. are flexible.
   c. are cost-effective.
   d. are all of the above.


Lesson 9
Practical Microprocessors                                                       143
    THIS


## Page 170



    PAGE
    LEFT
   BLANK

    By




## Page 171


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



_ _ _ _ _ _ LESSON 10
                                                                                    Control Circuits


This lesson deals with the control signals used in microprocessor-based systems            INTRODUCTION
and the circuits that generate, transmit, and respond to them. Electrical circuit
considerations are also presented. The discussions center on these topics as they
relate to the J-LLab.


There is an additional output port in the J-LLab, called the control port. You may         THE CONTROL
not be aware of it because it is not obvious to the user. The microprocessor uses          PORT
it to send signals to special circuits. The PROT bit of this port controls the
memory protect circuit described earlier. If this bit is set, the first three-fourths of
the RAM is "write protected." The other two bits control the HDWR and INSTR
single-step circuits, which are described later in this lesson.


Figure 10-1 shows the control port register. It is clocked by the CTL (control
port) select signal generated by the address decoder. This is similar to the other
output ports. The unusual thing about the control port is that the data inputs are
connected to the address bus instead of the data bus. Therefore, the data written
to the port is independent of the state of the data on the data bus.


                                                9


                                             ClK
                     .          5
                                     0       Ica      Q
                                                            a
                     .          12
                                     D
                                           74lS175

                                          Fllp·FlOP
                                                      Q
                                                      Q
                                                           10
                                                                     ~   PROT
                                                                         ARMSS
                                                      aD
                     ..         13
                                     D                Q
                     ~


                                                      a . . . 14
                                             ClR

                                               1


                     Figure 10-1.        Control Port Register of J.LLab


Lesson 10
Practical Microprocessors                                                                                145
                    How, then, does this port work? If you refer back to Figure 8-1, you can see that


## Page 172


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


                    the control port is selected by any address from 1000 to 17FF. This allows the
                    eleven low-order address lines to contain any value and still select this port.
                    Notice that AO, A 1, and A2 provide the data inputs to the register. The address
                    used determines the data written to that port. For example, a write to address 1000
                    clears all the bits. A write to address 1001 sets the "PROT" bit, and a write to 1004
                    sets the "INSTR" bit.

                    This technique simplifies the control software. Since it doesn't matter what data
                    is sent to the port (only the address matters), the software does not have to set up
                    a data value before it writes to the port. The hardware is no more complicated
                    than if the traditional arrangement were used.

                    Note that this control port is used for special features such as single-stepping and
                    memory protection. It is not one of the basic control circuits required by the
                    microprocessor system.

              THE   Throughout this text, a 16-bit address bus and a separate 8-bit data bus are
      MULTIPLEXED   assumed. The 8085 microprocessor, however, multiplexes (shares) the data bus
                    pins with the lower half of the address bus pins. The remaining eight bits of the
             BUS    address (the upper half) are on separate address pins. This technique reduces
                    the pin count of the microprocessor.
                    The Address Latch Enable (ALE) signal indicates when the address/data bus
                    contains an address. This signal is used to latch the bus contents to generate the
                    lower half of the address bus (see Figure 10-2). IC2 is an eight-bit latch with

                                         12
                                     ADO                                                   DO
                                         13
                                     AD1                                                   D1
                                         14
                                     AD2                                                   D2
                                         15                                                      Data
                          Address/   AD3                                                   D3    Bus
                           Data      AD4 16                                                D4
                            Bus      AD5 17                                                D5
                                     AD6 16                                                D6
                                     AD7 19                                                D7

                                                               d IN          OUT 2         Ao
                                                             ---±                 5        Ai
                                                                7                 6        A2
                                                                         IC2
                                                                8      74lS374    9        A3
                               IC3                             13
                              8085                                    ADDRESS 12           A4
                                                               14      lATCH     15        A5
                                                               17                16        A6
                                                               18                19        A7
                                                                      ClK
                                     ALE 30      3       4             J
                                                      IC12                                       Address
                                                                                                  Bus

                                      A8 21                    8 IN       OUT 9           A8
                                      A9 22                    6               7          A9
                           Address A10 23                      4               5          A10
                             Bus                                      IC1
                                      A11 24                   2
                                                                    81lS95
                                                                               3          A11
                          (High·order A 25                    12 ADDRESS 11
                             byte)     12                                                 A12
                                      A13 26                  14    BUFFER    13          A13
                                      A14 27                  16              15          A14
                                      A15 28                  18              17          A15


                                Figure 10-2.   Address Demultiplexing Circuit Used for f.J.Lab


146                                                                              Practical Microprocessors


## Page 173


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



three-state outputs. It latches the address information from the address/data bus
at the negative edge of ALE (the inverter IC12 is necessary to select this edge).
IC1 is a simple three-state buffer and is not really part of the demultiplexing.

Figure 10-3 shows a generalized picture of the bus timing. The A8-A15 lines
always contain the high-order address byte. At the beginning of each memory
cycle, the low-order address byte is placed on the address/data bus. The trailing
edge (high-to-Iow transition) of ALE indicates that the address is present and
causes the demultiplexing latch (IC2) to store the low-order byte of address.


                                Latched Low Order            Latched Low Order
       Ao·A7                      Address Byte                 Address Byte


                                 High Order                   High Order
                                Address Byte                 Address Byte


      ADO·AD7                                                        Data
                                                                     Out


         ALE


       READ


      WRITE

                       14-_ _ 0ne Memory _ _~
                                   Cycle


                       1 4 - - - - - Read -----t~--- Write _ _---t~
                                     Cycle           Cycle


 Figure 10-3.   8085 System Timing. The falling edge of ALE signals the rest of the
                system that the address/data bus contains a new address

The address information is then removed from the address/data bus to allow the
data transfer to take place. If a read operation is in progress, the microprocessor
issues a read signal, and the addressed memory or I/O device places the data on
the address/data bus. At the rising edge of READ, the microprocessor reads the
data from the bus.

The write cycle is similar, except that the direction of the data transfer is reversed.
At the beginning of the cycle, the low-order address byte is placed on the
address/data bus and ALE is pulsed. Then the microprocessor issues a write
pulse and places the data on the address/data bus. At the rising edge of WRITE,
the addressed memory device stores the data from the bus.

With the addition of the demultiplexing latch (shown in Figure 10-2), the
function of the buses is identical to nonmultiplexed buses. The address/data bus
simply becomes the data bus. Notice that this "data bus" contains address
information early in each memory cycle. However, since the data bus is not in use
at that time (neither READ nor WRITE are true), no conflict results.


Lesson 10
Practical Microprocessors                                                                 147
 THE 8085 FAMILY   The multiplexed bus frees 7 pins on the 40-pin microprocessor for other functions


## Page 174



                   (16 address plus 8 data lines are replaced by 8 address, 8 address/data, and ALE).
                   Standard memory and I/O devices are interfaced to the bus by use of a simple
                   eight-bit demultiplexing latch.

                   Several memory and I/O ICs that were made specifically for use with the 8085
                   contain an address demultiplexing latch right on the chip. These chips have
                   eight address/data inputs and an ALE input. They use 40-pin packages to allow
                   I/O ports to be included on the chip. One such part (the 8155) contains a 256
                   byte RAM, three I/O ports, and a timer. The 8355 contains a 2K byte ROM and
                   two eight-bit I/O ports. These chips make possible simple, powerful micro-
                   computer systems. They are not used in the ,uLab because much of the bus
                   activity is hidden inside them. They are therefore not as well suited for use in a
                   teaching product.


                                                                                         Lesson 10


## Page 175


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



 - - - - - -_ _ _ EXPERIMENT 10-1
                                                                                                Bus Timing


    CONCEPT
    In this experiment, you can observe the operation of the address/data bus with an oscilloscope and see
    a real-life example of the multiplexing shown in Figure 10-3.

    PROCEDURE
     A) Connect the oscilloscope as follows:
         1. Channel A to data bus line DO (insert the probe tip into the 00 plated-through hole).
         2. Channel 8 to ALE (IC12-3).
         3. Trigger on channel A.
         4. Set both input channels to 2 V/div and the sweep speed to 1 J.Ls/div.
      8) Key in the following program:
                                      0800          C3         LOOP:    JMP   LOOP
                                      0801          00
                                      0802          08

         This program is a single jump statement that jumps to itself. The microprocessor repeatedly
         executes this short loop, which enables you to get clear oscilloscope displays of the bus activty.
     C) Run the program.
     D) Adjust the trigger level until a stable display is obtained (see Figure 10-4). Channel A is connected


                    A00
                                                                                      2V/ div
           (00 data bus)


                      ALE
                 ( IC12-3 )            I       i~
                                                                              rtL     2V/ div


                       A0
                                 11111I11111

                                                         1 J.l.s /div
                      Figure 10-4.   Falling Edges of ALE Indicate Stable Addresses on A00


Lesson 10
Practical Microprocessors                                                                                   149
EXPERIMENT 10-1 _ _ _ _ _ _ _ __


## Page 176


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


( Continued)


          to the address/data bit 0 line (ADO). (See Figure 10-2 if this is not clear.) This waveform is
          somewhat messy since it contains levels between the defined one and zero levels. This condition
          exists because the line is sometimes floating (i.e., no device is driving it).

      E) Remember that ALE signifies that an address is present on the address/data bus. At the falling
         edge of ALE, the ADO line from the microprocessor is latched into the address latch to create AD.
         Notice that the ADO signal is always at a stable, valid level at this edge of ALE.

      F) Draw in the A0 address waveform in Figure 10-4. The waveform changes only at the falling
         edges of ALE, when it takes on the value of ADO .

      G) Connect channel B to the AD line (use the probe tip and the plated-through hole). Verify that the
         display is similar to Figure 10-5. The AD waveform should look like the one you drew in
         Figure 10-4.

      H) Connect channel A to AD and channel B to ALE. Figure 10-6 shows the display. You can see that
         the AD line does indeed change only at the falling edge of ALE.

       I) Connect channel A back to ADO and channel B to READ (use the READ signature analysis
          test point just below the row of address bus LEOs). Figure 10-7 shows the display. When READ
          is low, the memory puts data on the address/data bus. At the rising edge of READ, the micro-
          processor inputs this data. Notice that the ADO line is at a stable, valid logic level at this time .


                                   ..
                       A00
             ( 00 data bus)                                                             2V/ div


                                   ~ 1:-


                                  lfrI;~c,
                      A0
                                                                                        2Vl div
         (A0 address bus)
                                                                    I.:   :li
                                                     1 IJ.sl div

           Figure 10-5.   Oemultiplexed A0 Address Line Generated from Multiplexed Address Line A00


                                                                                                      Lesson 10


## Page 177


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



_ _ _ _ _ _ _ _ _ EXPERIMENT 10-1
                                                                                              ( Continued)


                     A0
                                                                                     2V/div
        (A0 address bus )


                     ALE
                                                                                     2V/div
                 (IC12-3 )


                                                     1 /J.s /div

                                    Figure 10-6.   ALE Line Controls A0


                    AD0
           (00 data bus )                                                             2V/div


                  READ
                                                                                      2V/div
       (READ test point )


                                                    1 /J.s/div

          Figure 10-7.   Stable Data from AD0 Read into Microprocessor at Rising Edge of READ Signal


Lesson 10
Practical Microprocessors                                                                              151
EXPERIMENT 10-1 _ _ _ _ _ _ _ __


## Page 178


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


( Continued)


         J) Observe that there are times when READ is high and ALE is low (as shown in Figure 10-8).
             At these times, the address/data bus is not used, and it can be in a high impedance state. This
             accounts for the parts of the ADO waveform which are not at valid logic levels.


                                    r-


                      READ                                                                       2V/div
           (READ test point )


                                         f""1
                                                                                         T
                        ALE
                    (IC12-3 )
                                    I-
                                    L

                                    ~~
                                          A     jill
                                                                        'I
                                                                         ,.. I'"
                                                                             h
                                                                                   II
                                                                                        .-
                                                                                         Jlt      2V/div


                                                            1 Ils/div

             Figure 10-8. When READ is high and ALE is low, the AD0 line carries no logic information

      SUMMARY

      You examined the multiplexed bus signals while running a short program. The ADO line contains
      valid address information at the falling edge of ALE and data information at the rising edge of READ.
      At other times, the address/data bus is not used and may be at any level.


                                                                                                               Lesson 10


## Page 179


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



Clocks                                                                                OTHER CONTROL
All microprocessors are synchronous digital circuits and therefore require a          SIGNALS
clock. Most early processor ICs require external clock circuits to provide them
with the proper clock waveforms. Voltage, phase, and timing requirements are
often critical. The manufacturers of these processors (e.g., 6800, 8080) produce
clock and timing ICs designed specifically to provide the clock to the processor.
They are generally controlled by a quartz crystal.

Newer processors have internal clock circuits in which a crystal is connected
directly to two pins of the IC to provide the clock (e.g., the 8085 used in the
MLab). Alternately, when low cost is a concern and accuracy isn't important, the
crystal is often replaced with an RC timing circuit. Many microprocessors can
also be clocked by a TTL clock signal provided from a master system clock so
that multiple processors can be synchronized.

In general, the processor operates at some fraction of the actual crystal fre-
quency. For example, the 8085 used in the MLab has a 4 MHz crystal. The basic
machine cycle, however, is 2 MHz and the Clock Out signal that the 8085 provides
is also 2 MHz. Most MaS microprocessors operate in the 100 KHz to 10 MHz
range. Bipolar bit-slice processors are able to run at higher clock rates.

Reset
The Reset pin on the 8085 is used for power-up initialization (see Figure 10-9).
When a low level is applied to this pin, the microprocessor's internal circuits are
cleared. The program counter is set to 0000, and program execution begins from
that address. The power-up initialization routine in the ROM begins there. In a
typical product (and the MLab), power-up reset performs system verification tests
and then sets the peripherals to desired start-up conditions.

                       +5


                            10K
             INTRPT
              ---L.-
                5     6         8 RST 6.5
           r<' ~     :>-------"-f
          \7     IC12C
                 +5                                                       8085
                   I                                                      IC3
               ~b                                                         M~
                       ~_ _ _ _ _ _ _ _ _ _ _ _ _ _7-1RST 7.5


                       +5


              Reset

          ~J-                                               >8~_6-1TRAP

        Single _ - - - '
         Step                                          +5

                                                            10K

                                                        . -_ _3_6QR8S8t in
                                                     C4 +
                                                       ~3.3!'F


                        Figure 10-9.   Interrupt Circuitry of J..LLab


Lesson 10
Practical Microprocessors                                                                       153
      A resistor is used to pull the line high, and a capacitor to ground provides an


## Page 180



      automatic power-on pulse. When power is first applied, the discharged capacitor
      is at a low logic level. This level is applied to the Reset input. As long as it remains
      low, the processor remains reset. When the pull-up resistor causes the capacitor
      to charge up to the threshold of the input (which has a Schmitt trigger to elimi-
      nate transition noise), the processor begins executing the program at address
      0000. Notice that the ~Lab's RESET button does not go to the microprocessor's
      Reset input. If the RESET button were connected directly to the Reset input, then
      whenever RESET was pressed, the ~Lab would go through the power-up memory
      clear routine. This would destroy all of the programs stored in RAM. Instead, the
      RESET key goes to the Trap input line, described later in this lesson.

      Status
      The 8085 has two special status outputs, SO and S1. They provide additional
      information about the machine cycle in progress. They also indicate whether the
      processor is in a HALT state. The ~Lab, however, does not use these signals, since
      they are used only for special applications.

      Ready
      When the Ready input goes low, it causes the microprocessor to enter a wait
      state. In this state the buses remain at their current logic state until Ready goes
      high again. The wait state allows slower memory and I/O devices to be used with
      the microprocessor. If, for example, a memory chip requires the address to be
      stable for 1 ~s before producing valid data outputs, the microprocessor would
      read the memory's outputs before they were valid (it typically allows about
      400 ns for the memory to respond). To avoid this error, the memory's address
      decoder must contain a special circuit to control the Ready line. When the
      slower memory is addressed, the decoder brings the Ready line low for 1 ~s
      to ensure that the memory has sufficient time to respond.


      The ~Lab uses the Ready line for a different purpose. In the hardware-step mode,
      the Ready line is pulled low immediately after each machine cycle. This freezes
      system activity indefinitely so that the user can observe bus and status informa-
      tion at each machine cycle.

      Direct Memory Access
      Direct Memory Access (DMA) is a method for transferring data directly between
      the memory and a peripheral device without going through the microprocessor.
      DMA provides data transfers at a much higher rate than "programmed" transfers,
      which use the microprocessor to pass each byte of data. CRT and disk controllers
      often use DMA to increase data transfer speeds.

      The microprocessor's Hold control input is what makes this possible. When this
      line is high, the 8085 finishes the machine cycle it is currently executing and then
      stops to place a high level on the Hold Acknowledge (HLDA) line. All of the
      microprocessor's bus outputs (the address, data, and control buses) are put into
      the high impedance state. A peripheral device can now take control of these
      buses, and perform whatever data transfers are required. When the Hold line is
      set low by the peripheral, the microprocessor continues operation from where it
      was stopped.

      The peripheral must have a DMA controller to issue the address and control
      signals. DMA controller chips that perform this function are available.


                                                                               Lesson 10


## Page 181




Notice that if a microcomputer system has DMA capability, all bus buffers must
be three-state buffers. The HLDA line disables the buffer outputs and allows the
DMA controller to use the buses.


Interrupts
Interrupts permit external hardware to request immediate action by the proces-
sor. They interrupt the usual program flow and transfer control to a special
software routine. In this lesson, the hardware required to initiate an interrupt is
described. The software aspects of interrupts are discussed in Lesson 6. It is
assumed in this discussion that the interrupt in question is enabled by the
software.
There are two groups of interrupts on the 8085. The first group (TRAP, RST 5.5,
6.5, and 7.5) is controlled by individual pins on the microprocessor. They are
called single pin interrupts. The second group (RST 1, 2,3,4,5,6, and 71 is
controlled by I NTR and I NT A.
To initiate one of the interrupts in the first group, you simply apply a signal to
the corresponding pin on the microprocessor. The interrupt service routine for
that pin is then automatically addressed. Table 10-1 shows the address associated
with each pin, as defined by the 8085 microprocessor design.
                        Interrupt Pin    Interrupt Address
                           TRAP                0024
                          RST 5.5              002C
                          RST 6.5              0034
                          RST 7.5              003C
The interrupt inputs each respond to a different logic level or edge. The RST 5.5
and 6.5 interrupts respond to a high level (logic 1). The RST 7.5 interrupt
responds only to a positive edge, (i.e., a transition from low to high). The TRAP
interrupt responds to a high level but does not acknowledge a second time until
the logic level goes low and then high again.

The MLab uses the Trap input for the RESET button, the RST 6.5 input for the
INTRPT button, and the RST 7.5 input for the "SA" switch (see Lesson 17 for a
discussion of this switch). The ci rcuits are straightforward, with the exception of
the TRAP input (see Figure 10-91. An OR gate with active low inputs (actually a
NAND gate) allows the single-step circuit to access the TRAP input, which is
debounced by the hardware (R2, C10, and Schmitt input IC12E). The 100 ohm
resistor and the capacitor debounce the RESET key to ensure that it causes only
one interrupt each time it is pressed. It is not necessary to debounce the other
interrupt inputs because the software can disable the interrupt as soon as it is
acknowledged to prevent a second interrupt from occurring.
The use of the second group of interrupts is more complicated. The Intr ( I nter-
rupt Request) input initiates the interrupt. The circuit requesting the interrupt
provides a code on the data bus indicating which interrupt service address to
jump to. The Inta (Interrupt Acknowledge) pin on the microprocessor coordi nates
the timing of this operation. The I ntr interrupt is not used in the MLab.

Interrupt Priorities
Allowance is made for the fact that more than one interrupt can be requested
simultaneously. Each interrupt is assigned a priority, and the interrupt with the
highest priority is acknowledged first. TRAP has the highest priority, followed by
RST 7.5, 6.5, and 5.5, in that order. INTR has the lowest priority.


Lesson 10
Practical Microprocessors                                                              155
              THE   The j.tLab contains a special control circuit to provide the single-step functions.


## Page 182


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


      SINGLE-STEP   Figure 10-10 shows the portion of the single-step circuit used to advance the
          CIRCUIT
                               R3                           IC12F                     v, 74LS74                          SET SS
                                                                        +5V   -2. 0
                                                            ~12
                                                                                                                           ,.~
                              10011
                            J..    Jo.
                                                       13                        3                                FROM
                              vv ..                                                                 5 STEPSS
                                            +J. C12         V                 1
                                                                                     R
                                                                                      C IC10A
                                                                                          FF
                                                                                                  Q-            IC10B(9)


                                   FROM
                                   U3(30)
                                             ~ 3.3UF

                                             ALE
                                                            IC12B

                                                            3~ 4
                                                            /~ ALE
                                                                           i'                 +5V
                                                                                              gREE RUN
                                                            S5
                                                                                      52·2B

                                                   I   HDWR STEP
                                                                    I                    ~n.
                                                                                                  NORM


                                               ~
                                                                          STEP                           35
                                                                                                              Ready
                                                                                        3>                         IC3
                                                                                         ~ R5B
                                                                                         ? 10K                    8085

                                                                                       + 5V(1)


                    Figure 10-10. Single-Step Circuit of pLab Advances Microprocessor One Machine
                                  Cycle
                    microprocessor one machine cycle each time the HDWR STEP key is pressed.
                    The sequence of events for this circuit is as follows:

                       1. When the monitor program is running, the SETSS (Set Single-Step)
                          control signal (IC10-9) is low, forcing the STEPSS (Step Single-step)
                          signal (lC10-5) to be high. This line is connected to the Ready input of
                          the microprocessor (IC3-35) through switch S-2. The high logic level
                          on the Ready line allows the system to run at full speed.

                       2.         When a valid address appears in the j.tLab's display and HDWR STEP is
                                  pressed, the monitor program responds by transferring operation to the
                                  user program at the address specified and then setting the SETSS line
                                  high.

                       3.         At the next machine cycle, the ALE line will pulse low and reset latch
                                  IC10A causing the STEPSS line to go low. This in turn forces the Ready
                                  line low.
                       4.         With the Ready line low, all activity on the system stops. The j.tLab is now
                                  in the hardware single-step mode. The address previously on the dis-
                                  play is now indicated on the address bus LEDs.
                       5.         When the HDWR STEP key is pressed again, a rising edge appears at
                                  clock input pin IC10-3 causing the STEPSS line (and the Ready line) to
                                  go high. The HDWR STEP key is debounced by R3, C12, and IC12F.

                       6.         With the Ready line high once again, the microprocessor resumes nor-
                                  mal program execution, going on to the next machine cycle.

                       7. As soon as the next machine cycle occurs and a new address is latched,
                          the ALE line pulses low. Again, this causes latch IC10A to reset and the
                          STEPSS line to go low.


                                                                                                                 Lesson 10
156                                                                                              Practical Microprocessors


## Page 183




   8. This sequence is repeated each time the HDWR STEP key is pressed.

   9.   When the RESET key is pressed, IC10B is reset causing the SETSS line
        to go low. This in turn forces the STEPSS signal high. The RESET signal
        is also sent to the Trap Interrupt of the microprocessor (IC3-6). This
        interrupt returns system operation to the monitor program.


One common use of interrupts is with a programmable interval timer. Basically,         PROGRAMMABLE
it is a counter, which is started by a command from the microprocessor and then        TIMERS
counts at a known rate (usually crystal controlled). When it reaches the number
of counts programmed, it interrupts the microprocessor. The microprocessor
uses this counter interrupt to perform accurate timing functions without the need
for timed program loops (as used by the J-tLab). The microprocessor can execute
other programs while this timing function is operating. Other timing functions can
also be performed with many of the timer ICs available.

In the J-tLab, the software timing loops used in the display scan routine could have
been replaced with a timer circuit. In freeing-up the microprocessor from this
time-consuming task, much longer programs could then have been executed
between each display scan instruction.


One of the attributes of digital systems arises from the fact that they can be         ELECTRONIC
analyzed from a logical viewpoint. You can think purely in terms of on and off,        CONSIDERATIONS
one and zero, or yes and no. Unlike analog circuits, they use very little mathemat-
ical or electronic theory. The ICs are often thought of as black boxes. However,
some electronic factors must be taken into account to ensure that the logic
operates logically.

Loading
One of the most important factors to consider is output loading. A gate's output
can supply only a limited amount of current, and, if forced to supply more, the
circuit may not work properly. If the circuit is severely overloaded, logic levels
may change or a gate may overheat and burn out.

The two types of loading generally considered in microprocessor systems are
static and dynamic. Static loading results from resistive and current components
on logic nodes. Dynamic loading is primarily the result of node capacitance. Static
loading of MOS outputs that drive multiple TTL inputs is usually the primary area
of concern. However, when a large number of devices are on a bus and the
bus extends through connectors to multiple boards, dynamic (capacitive)
loading can become important. Whereas static loading generally affects logic
voltage levels and noise margins, dynamic loading affects speed and timing by
slowing down level transitions.

The static loading problem is particularly severe in microprocessor systems
because many devices can be connected to the same bus. The microprocessor's
address outputs must be able to drive all the devices that are connected to the
address bus. Every device that drives the data bus must be capable of driving all
the devices connected to the bus.

The J-tLab uses buffers on all the address lines because it does not have enough
output drive current available to power the address bus LEOs. The data bus is


Lesson 10
Practical Microprocessors                                                                         157
      only partially buffered, as shown in Figure 10-11 . To buffer the data bus right at


## Page 184


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


      the microprocessor would require a bidirectional buffer, since data passes in both
      directions on the data bus. Instead, the ~Lab uses a unidirectional buffer (IC14)
      to generate a buffered "data out" bus that drives the output ports and the data
      bus LEOs.

                                                                               Keyboard
                                                                   Input         Input
                              ROM              RAM
                                                                   Port            Port


           8085



                                                       Data Bus
                                                        Buller
                                                        (IC14)


                                              Bullered Date Out BUI


                             Output          Display               Scan
                              Port            Port                 Port


                           Fi gure 10-11 .   Data Bus Buffer of j.LLab

      Although the ~Lab uses noninverting buffers for the address, data, and control
      buses, many systems use inverting buffers, which generate negative logic buses.
      Negative logic presents no problem so long as you are aware of it, as in the
      ~Lab' s output port LEOs (the LEOs indicate negative logic). Inverting buffers are
      used because they are often cheaper, faster, or consume less power than non-
      inverting buffers.

      Bypassing
      As in all digital systems, care must be taken to keep the power supply and ground
      lines as noise-free as possible. Bypass capacitors (usually .01 or 0.1 ~F) are
      scattered over PC boards. In addition , a 10 ~F or greater tantalum capacitor is
      placed on the circuit board for the 5 volt supplies.

      Timing
      There are many timing relationships that must be satisfied for a microprocessor-
      based system to operate correctly. Most of these are controlled internally by the
      microprocessor so that signal flow among the devices in the system can be
      coordinated. The address, data, and control buses all adhere to strict timing
      relationships.

      Figure 10-12 shows the timing for a write operation. The address must be stable
      for a given period of time (called the access time) before any operation may be
      performed, to allow the memory's internal address decoders to select the speci-
      fied memory cells. The data must then be stable for an additional period of time


                                                                                      Lesson 10


## Page 185


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



(called the set-up time) before the write occurs. The data must also be stable for a
period of time (called the hold time) after the write pulse. Finally, the write pulse
must have a minimum duration.

                                                               Data written to memory
                                        Access Time
                                       from Address


             Address


                  Data - - -


                                                                   Data Hold Time
                                                 Write Pulse
                                                   Width


                                                Data Setup
                                                   Time


     Figure 10-12.       Data Stored in Memory on Rising Edge of WRITE Signal

Figure 10-13 shows the timing for a read operation. As with the write operation,
the address must be stable long enough to allow the memory's internal decoders
to settle. A read pulse is then generated, and, after a period of time (the data
access time), the memory places the addressed data on the data bus. This data
must be stable for the set-up time before the rising edge of READ, when the
data is read into the microprocessor. The data must also remain stable for the
data hold time.

                                                                       Data Read into
                                                                       Microprocessor
                                               Address
                                             Access Time


             Address


                  Data


                               Oats Access                               Data Hold Time
                                  Time

                                                      Data Setup
                                                         Time


  Figure 10-13.     Data Read into Microprocessor on Rising Edge of READ signal


Lesson 10
Practical Microprocessors                                                                 159
      Figure 10-14 shows the CPU timing for a typical instruction. The basic unit of


## Page 186


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


      time is the state, which is one clock period. A machine cycle consists of from
      three to six states. Most simple operations (such as moving one register to
      another or reading a memory location) require one machine cycle. The instruc-
      tion cycle is the time required to execute an entire instruction and consists of
      from one to five machine cycles.


        Clock


                I + - - - - - - - - I n s t r u c t i o n C y c l e - - - - - -_ _-+I


                        Machin~Machine~
                         Cycle   Cycle  aChin~eaChine
                                        Cycle    Cycle


                  State
                             I     I           I     I           I     I            I        I
                 500 ns.
                for I'Lab


                Note: This is only a typical instruction cycle; there are many variations.
                      An instruction cycle may contain one to five machine cycles.
                      A machine cycle may contain three to six states.


                                 Figure 10-14.      Typical Instruction Cycle

      Figure 10-15 gives the complete system timing for an OUT instruction. States are
      denoted by T1, T2, and so on, and machine cycles by M1, M2, and so on. This
      diagram combines all the timing discussed earlier: the multiplexed bus, reads,
      and writes.

      In the first machine cycle (M1) the opcode is fetched from the memory. In M2 the
      second byte of the instruction (the port address) is read from the memory. In M3
      the instruction is executed: data is written to the 1/0 port.

      All instructions require one machine cycle to fetch the opcode. For simple
      instructions that do not use the memory or 1/0 (such as register transfers), the
      execution is performed during the first (and only) machine cycle. For multiple-
      byte instructions (such as MVI A,7 or STA 0837), one machine cycle is required
      to read each byte of the instruction. If the instruction execution requires a
      reference to memory or 1/0, the execution requires an additional cycle. Some
      complex operations use an extra machine cycle to execute the instruction, even
      though the operation is internal to the microprocessor.

      The MLab uses these cycles for its single-step modes. HDWR STEP steps one
      machine cycle at a time, and INSTR STEP steps one instruction cycle.

      Although the details of timing may vary in any specific situation, these are the
      basic timing considerations. The microprocessor manufacturers have worked out
      all the timing details for families of parts in a system so that they are generally
      compatible in this respect. Care must be taken, however, when using general-
      purpose parts with a specific microprocessor.


                                                                                            Lesson 10


## Page 187


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



       elK       T,


    Ae·A'5


   ADO·AD7


       ALE



    WIi1TE


      101M


   STATUS                                                                       11


  CD (Low Order Address)
  ® Data from Memory (Instruction)
  ® Data from Memory (1/0 Port Addreas)
  ® Data to Memory or Peripheral

          Figure 10-15.     Timing for Fetching and Executing OUT Instruction


Lesson 10
Practical Microprocessors                                                            161
REVIEW _ _ _ _ _ _ _ _ _ _ _ _ __


## Page 188



Lesson 10


            The control port in the ,uLab is controlled by the microprocessor and memory
            protection and single-step circuits. The multiplexed bus shares eight pins of the
            microprocessor between the address and data bus. Another pin (ALE) indicates
            when address information is on these lines. The Reset pin is used for power-up
            initialization. The two status pins provide advance control information. The Ready
            line is used to force the microprocessor to wait for slow devices.

            Direct memory access allows high-speed data transfers to occur between
            memory and an external circuit by bypassing the microprocessor. Interrupts
            allow the external hardware to request the microprocessor to perform special
            operations. Electrical loading, bypassing, and timing are important factors in
            microprocessor system design and troubleshooting.


                                                                                 Lesson 10


## Page 189




___________________ C)LJi7
                                                                                  Lesson 10


1. An advantage of using a multiplexed bus in the 8085 is:
   a. higher system speed.
   b. more pin functions are available on the processor.
   c. simpler control hardware.
   d. all of the above.


2. When the WRITE line goes from low to high, the address/data bus contains:
   a. valid data.
   b. valid address.
   c. valid control signals.
   d. unstable information.


3. When memory devices are slower than the microprocessor, the
   a. HOLD
   b. TRAP
   c.INTR
   d. READY
   pin is used to tell the microprocessor to wait.


4. An advantage of DMA is that:
  a. faster data transfers can occur.
  b. the microprocessor controls the data transfers.
  c. the data transfer circuits are less complex.
  d. slower memory can be used.


5. If the RESET key on the j.lLab were connected to the Reset pin on the micro-
   processor, it would cause:
  a. a hardware conflict
  b. the buses to disable
  c. the same effect as being connected to TRAP
  d. the memory to be cleared
   when RESET was pressed.

6. An advantage of the single pin interrupts is that:
  a. they reduce the pin count of the microprocessor.
  b. the interrupt circuit is simplified.
  c. they do not specify their own interrupt service routine address.
  d. all of the above are true.


Lesson 10
Practical Microprocessors                                                                163
QUIZ _ _ _ _ _ _ _ _ _ _ __


## Page 190



(Continued)


              7. The primary purpose of assigning priorities to interrupt lines is to:
                a. select the interrupt routine address.
                b. determine which interrupts are used most often.
                c. specify which interrupt is to be selected when more than one occurs.
                d. prevent the microprocessor from simultaneously executing more than one
                   interrupt routine.


              8. In a system with many MOS devices, the main bus loading factor is likely to be:
                 a. capacitive.
                 b. resistive.
                 c. current.
                 d. static charge.


                                                                                   Lesson 10
164                                                                Practical Microprocessors


## Page 191




                                                                                                     IV
- -_ _ MiCROPROCESSOR
             SOFTWARE

                            This section provides a more detailed look at microprocessor software. A rep-
                            resentative selection of 8085 assembly language instructions is discussed, with
                            examples and experiments to demonstrate their use. Lesson 13 describes the
                            software development process, and an example is presented. The next lesson
                            presents programs to control the keyboard and display. Finally, representation
                            techniques for large and fractional numbers are described, along with techniques
                            for calculating complex mathematical functions.

                            A detailed knowledge of software is not absolutely required for troubleshooting
                            microprocessor systems. However, a good general knowledge of software is
                            necessary to thoroughly understand the system. Therefore, while this section
                            may be omitted without loss of continuity, it should be studied for a fuller under-
                            standing of microprocessor systems.


Lesson 11
Practical Microprocessors                                                                                  165
    THIS


## Page 192



    PAGE
    LEFT
   BLANK

    By




## Page 193




_ _ _ _ _ _ LESSON 11
                                                   Registers and Breakpoints


This lesson provides background material for the more detailed discussion of             INTRODUCTION
microprocessor software presented later in this section. The instructions that
have already been described are summarized, and a few new ones are intro-
duced. The microprocessor's registers are described, and the j.LLab's FETCH
REG key is used to examine and modify them. Finally, the use of the breakpoint
as a software debugging tool is described.

Several of the 8085's instructions have already been discussed. In this lesson,          INSTRUCTION
these instructions are reviewed to provide a foundation from which to describe           REVIEW
some new instructions. For a complete description of the 8085 instruction set,
refer to Appendix B.

Some shorthand notation is useful in describing instructions. In the following
text, the term data is used to indicate any eight-bit quantity, and adrs to indicate
any sixteen-bit address.

Data Manipulation: MVI, INR, CMA
One of the most fundamental microprocessor operations is to load the accumu-
lator with data. This is done by the MVI A,data instruction (move immediate to
the accumulator). The data to be moved to the accumulator is stored in the byte
following the opcode.

Once the data is in the accumulator, instructions are needed to manipulate it. The
two instructions that have been used so far are INR A (increment accumulator)
and CMA (complement accumulator).

Testing and Jumping: CPI, JMP, JZ
To test the value in the accumulator, the CPI data (compare immediate) instruc-
tion can be used. This compares the data specified in the second byte of the
instruction with the contents of the accumulator and sets the processor flags
accordingly. The only flag that you have used so far is the zero flag, which is set if
the result of an operation is zero. The JZ adrs (jump if zero) instruction tests the
zero flag (presumably set by a previous instruction, such as CPI) and causes a
jump if the flag is set. There is also an unconditional jump instruction JMP adrs
that causes a jump regardless of the state of the flags. The address for both jump
instructions is stored in the two memory bytes following the opcode.


Lesson 11
Practical Microprocessors                                                                              167
                    Memory and I/O: LOA, STA


## Page 194



                    The LOA adrs and STA adrs (load accumulator and store accumulator) instruc-
                    tions transfer data between the accumulator and memory or I/ O ports. The
                    address of the memory location or I/O port is specified in the two bytes following
                    the opcode.
                    Subroutines: CALL, RET
                    To use subroutines, two more instructions are needed. CALL adrs is used to
                    jump to a subroutine, and RET (Return) is used to end a subroutine. The CALL
                    instruction specifies an address exactly like a jump instruction. The RET instruc-
                    tion does not specify an address, but causes a jump to the instruction that follows
                    the previously executed CALL.

                    Interrupt Control: SIM, EI, 01
                    Control of the interrupts requires three instructions. SIM (set interrupt mask) is
                    used to specify which interrupts should be enabled and which should not. It
                    copies the contents of the accumulator into the processor's Interrupt Mask
                    register. EI (enable interrupts) causes the selected interrupts to be enabled. 01
                    (disable interrupts) disables all interrupts.


   THE VARIETY OF   This relatively small set of instructions demonstrates most of the 8085's basic
    INSTRUCTIONS    capabilities. As you become familiar with more instructions, it will become
                    apparent that there are more instructions than are necessary. The variety of
                    instructions available makes it easier to write programs, since you can choose
                    from several alternatives. There is a direct parallel in hardware design: it is
                    possible to build any logic circuit using only NAND gates. In fact, entire
                    computers have been built in this way. However, the system is greatly simplified
                    by using other devices such as NOR gates, flip-flops, multiplexers, counters, and
                    adders.

     THE GENERAL-   Up to this point, one major feature of the 8085 microprocessor has been ignored :
                    its general-purpose registers. There are six eight-bit registers within the 8085,
PURPOSE REGISTERS
                    which can be used for temporary data storage. Figure 11-1 shows the 8085 block
                    diagram including these registers. They are called the S, C, D, E, H, and L
                    registers. The stack pointer is also shown.


                    Figure 11 -1. Simplified Block Diagram of 8085 Showing General-Purpose Registers


                                                                                           Lesson 11


## Page 195


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



To use these registers, some new instructions are needed . The MVI instruction,
which loads data into the accumulator, can in fact be used with any register. For
example, MVI D,data causes the data to be moved to the 0 register. The general
form of this instruction is MVI r,data where r indicates any of the registers (A, B,
C, 0 , E, H, or L) . Although the accumulator is special in that it is used for the
results of computations, it may also be used as a general-purpose register.

The INR instruction can also be used on any register. The general form is INR r.
For example, INR H increments the H register.

Now that all these registers are available, it is useful to have a way to move data
from one register to another. The general form of the instruction that does this
is MOV r1,r2. Reg ister r1 is the destination, and register r2 is the source . For
example, MOV A,H moves the contents of the H register into the accumulator,
but the contents of H are not changed. Note. that the source and destination are
listed in the opposite order from what you might expect. You can think of the
instruction MOV A,H as "move into the accumulator the contents of the H
register".

The Assembly Language Reference Card lists all of the 8085's instructions in
mnemonic and hexadecimal forms and shows all the various MOV instructions.
This is your guide for translating assembly language mnemonics into hexadeci-
mal machine code, and vice versa. It also provides a convenient list of all available
instructions.

The general-purpose registers are useful when a program uses several different
variables. Each register can be used for a different purpose. RAM locations are
not needed for data storage as long as the six registers are sufficient. For
example, a program that counts six different events can use one register for
counting each event.

Notice that on the reference card there is an M "register" listed in the MOV            INDIRECT
instructions. This is not really a register, but refers to a memory location whose      ADDRESSING
address is stored in the Hand L registers. The Hand L registers hold an address
that points to a location in memory. This is called indirect addressing, which
means that the instruction specifies where the address is stored (the Hand L
registers in this case) rather than the actual address.

For example, if H contains 12 and L contains 37 (see Figure 11-2). the instruction
MOV A,M will load the accumulator with the contents of memory location 1237.
The effect is exactly the same as the instruction LOA 1237.


                  I -r-:-=-='.::o...<:.--=-==-;
                  I
                  I
         processor:
                  I
                  I
                  L_


            Figure 11-2. Indirect Addressing using Hand L Registers


Lesson 11
Practical Microprocessors                                                                            169
      This is an example of how the same operation can be performed in two different


## Page 196



      ways. MOV A,M is a single-byte instruction, but requires that the Hand L
      registers be previously set to the desired address. LOA 1237, on the other hand, is
      a three-byte instruction. However, it is often preferable because it does not
      require that the address be stored in the Hand L registers. Indirect addressing is
      particularly useful for table-oriented operations, such as the table look-up
      described in Lesson 15.


                                                                             Lesson 11


## Page 197




--------_EXPERIMENT 11-1
                                                                                 Using the Registers


   CONCEPT

   A short program is entered to demonstrate the use of the general-purpose registers and the operation
   of the MOV instruction. The FETCH REG key is used to follow the execution of the program.


    PROCEDURE

       A) Key in the program in Table 11-1. This program first sets the B register to 37 and then copies it
          into the H register. Finally, the H register is incremented.


                            Address            Contents          Instruction          Comments

                                 0800              06           MVI     B,37         ;Set B to 37
                                 0801              37
                                 0802              60           MOV H,B              ;Move B to H
                                 0803              24           INR H                ;Increment H


                                           Table 11-1.   Register Demonstration Program


       B) Verify that the program is correctly stored.

       C) Press F:~;~   8 0 8 8 '~:;: .                  The MVI B,37 instruction is executed.

       D) Press t~~f). The display shows the contents of the A register.

       E) Press ~~N"c": twice. The display shows the contents of the B register (37).

          Pressing f~~~) puts the J-LLab into the register mode and displays the contents of the A

           register. Then   ~~,.o;..   and (o~) are used to select a particular register. Table 11-2 shows

          the order in which the registers are displayed.


Lesson 11
Practical Microprocessors                                                                                     171
EXPERIMENT 11-1 _ _ _ _ _ _ _ __


## Page 198



Continued


                                  Abbreviation                        Description
                                     A                Accumulator
                                     Fl               Flags
                                     B
                                     C
                                     D
                                                      General-purpose Registers
                                     E
                                     H
                                     SPH              Stack Pointer High-order byte
                                     SPl              Stack Pointer low-order byte
                                     PCH              Program Counter High-order byte
                                     PCl              Program Counter low-order byte
                                     I                Interrupt status

                                                 Table 11-2.   8085 Registers


      F) Press (DECR) five times. The display shows PCH (Program Counter High-order byte). Since the

          PC is sixteen bits long, it must be displayed in two parts.

      G) Press ~~,."CR: to see the lower half of the PC. The PC contains the address of the next instruction

         to be executed (0802).

      H) To return to the execution of the program, press (~~) to set the address back to 0802,
          and then   '~:;:   to execute the MOV H,B instruction.

       I) Press f~~~H) to put the #Llab into the register mode. Then press ~,',."c": twice to view the B register.

          It is unaffected by the MOV H,B instruction, so it still contains the data 37.

      J) Press ~:N"c": four more times to view the H register. It now contains 37, the data from register B.

      K) Press (~) to return to the program. Press             '~;:    to execute the INR H instruction.

      l) Press (~) and then use ~:N"c"" to view the contents of the H register. Its contents have been

         incremented by the INR H instruction.


                                                                                                         Lesson 11
172                                                                                      Practical Microprocessors


## Page 199




_ _ _ _ _ _ _ _ _ EXPERIMENT 11-1
                                                                                              Continued


   SUMMARY

   This experiment demonstrated the use of the microprocessor's general-purpose registers. A program
   was entered that set the B register to 37, copied the data to the H register, and then incremented the H
   register. Then you stepped through the program and verified the operation of each instruction.

   The FETCH REG key was used in combination with STORElINCR and DECR to view the 8085's
   registers. This makes it possible to verify the operation of each instruction by stepping through the
   program and examining the registers of interest after each instruction is executed.


Lesson 11
Practical Microprocessors                                                                                     173
        BREAKPOINTS    Single-stepping through a program allows you to stop between instructions and


## Page 200



                       observe the effects of each instruction. However, in many cases it is more
                       convenient if the program runs at full speed and then stops at a particular point
                       of interest. This can be done by inserting an instruction in the program that
                       causes the processor to jump from your program to the monitor program. This
                       instruction is called a breakpoint. Once control has returned to the monitor, all of
                       its facilities (such as examining or modifying registers or memory locations) are
                       available to you.

                       The /-lLab uses the Restart 1 (RST 1 ) instruction for the breakpoint. It is similarto
                       a CALL instruction except that it does not explicitly specify an address. RST 1 is
                       equivalent to CALL 0008; the address 0008 is fixed by the design of the 8085 and
                       cannot be changed. The subroutine beginning at this ROM location saves the
                       contents of the registers in RAM and then returns to the monitor program.

USING BREAKPOINTS      Breakpoints are a valuable tool for debugging programs. They are inserted at key
                       points in the program to facilitate program debugging. Breakpoints can be
                       inserted after a program is written by replaCing a program instruction with a
                       breakpoint. The breakpoint stops the program at the desired point, so you don't
                       need to single-step through all the preceeding instructions. You can then
                       examine the registers and memory to see if the program operates as expected.
                       Once the program operates correctly, the breakpoints can be replaced by no-ops
                       (or by the instruction which was displaced by the breakpoint).


          HARDWARE     The breakpoint used in the /-lLab is a software breakpoint, implemented with a
        BREAKPOI NTS   breakpoint instruction. There are also hardware breakpoints, which are imple-
                       mented with a special logic circuit that monitors the address bus. When it
                       senses the breakpoint address, it halts the processor, using its control inputs.
                       Software breakpoints can be used only for programs in RAM, since the
                       breakpoint instruction must be stored as part of the program. Hardware break-
                       points, on the other hand, can be used for programs in ROM or RAM.


  174                                                                           Practical Microprocessors


## Page 201




