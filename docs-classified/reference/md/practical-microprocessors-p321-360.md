# Practical Microprocessors

- Source PDF: `docs/Practical Microprocessors.pdf`
- Category: `microprocessor-lab-handbook`
- Printed: `March 1979`
- Pages: `321-360 of 484`
- Conversion: `pdftotext` with page markers
- Figures: `docs-classified/reference/practical-microprocessors-p321-360/figures`
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

## Page 321





                                                                                       -'."


                                                                   Troubleshooting
                                                           Microprocessor Systems


The troubleshooting philosophy for microprocessor-based products is funda-
mentally no different than for standard digital designs. As with any circuit you are
trying to analyze or troubleshoot, it is helpful to first become familiar with the
circuit. Studying the theory of operation, the block diagram, and the schematic
provides a base of knowledge from which to work. In this lesson, problems
relating to microprocessor systems and the troubleshooting techniques for
dealing with them are discussed.


There are a number of testing problems somewhat unique to microprocessor
systems. For one thing, most of the control is in the software, so that signal flow
is hard to trace. Another difficulty is that everything happens too rapidly to see
in real time. In most cases, a microprocessor system, unlike many logic circuits,
cannot be stopped and manipulated. Measurements must be taken while the
microprocessor is running. This requirement reduces the effectiveness of the
logic probe and pulser but enhances the usefulness of the current tracer, oscillo-
scope, signature analyzer, and logic analyzer because these instruments rely on
circuit activity for their measurements.


Microprocessor bus structures pose additional difficulties. Data on these buses
is often unstable or meaningless because of three-state outputs, multiplexing,
and switching transients. These conditions cause no problems for the system
itself, since it is synchronous and knows when the bus lines contain stable
signals. The signature analyzer and the logic analyzer also know when these
lines are valid, because of clock signals provided to them. The oscilloscope does
not have this capability. It provides little quantitative information, but is useful for
examining qualitative factors, such as general activity, logic levels, waveform
timing, and bus conflicts.


Since bus structures also make it possible for many devices to be connected
together on a Single node, finding the one bad device on such a node can be
difficult. The current tracer is useful for this purpose. The data bus also acts as
a digital Signal feedback path and tends to propagate errors through good


Lesson 18
Practical Microprocessors                                                                     295
           ,.     . ,.


## Page 322



                Ik,"'trtll~


                                         !   '51   1742A OSLlll OSCOP£


                Osc illoscope Helps Id entify Prob lems in Mic ropro cessor Sys tems

      circuits and then back to the fault source. The best way to deal with this problem
      is to open the feedback path when possible. Techniques for doing so are
      discussed in this lesson.


      Complex devices are often connected to the microprocessor buses. It is difficult
      to test these devices using simple stimulus-response testing . The correct opera-
      tion of these devices can be verified by swapping them with a known good chip,
      or by observing that the function they perform for the system is being performed
      correctly.


      Microprocessors are sequential machines. Program flow depends on a long
      sequence of instructions and events. If even a single bit of information is
      incorrect, the whole system can go awry. Noise glitches and bad memory bits are
      the most common sources of single-bit errors. Others are also discussed in this
      lesson. These failures are difficult to pinpoint because the entire system may
      appear to be operating incorrectly.


      Experience gained from doing the Microprocessor Lab troubleshooting experi-
      ments in Lesson 19 will provide you with a good foundation for troubleshooting
      other microprocessor-based products. Such experience can prevent the really diffi-
      cult troubleshooting problems from being thrown under your bench (or worse ). New
      things always seem more difficult at first, and the same is true of microproces-
      sors. Designed-in serviceability and good documentation by the manufacturer can
      make troubleshooting much easier. The use of signature analysis and other high-
      level servicing aids can greatly reduce the task of troubleshooting .


                                                                                         Lesson 18


## Page 323




Dozens of different microprocessors exist, and hundreds of people design
products and service procedures for them. Since the ,uLab is specifically
designed for educational purposes and for teaching troubleshooting, the con-
cepts developed using the ,uLab should be applicable to many classes of micro-
processor systems. It is as close to a typical (but small) system as is practical.


Bad clocks can cause fouled, but "running," systems. There are a number of
malfunctions that can result in system clocking problems. Clock problems can
show up as a failure of the system to function at all (no activity), the ability to
function only open-loop (free-running), or semifunctional activity (a meaning-
less and undefined program sequence I. Some microprocessors are sensitive to
clock speed. Since many systems run "at spec," even a small variation in clock
rate (too fast) can cause system failures. If the system runs too slow, dynamic
storage cells on ICs in the system may fail. Both of these problems are more
likely to occur when resistor and capacitor (RC) clock circuits are used instead
of the more accurate and stable crystal-controlled circuits. However, crystals can
sometimes break into their third overtone oscillation mode, causing a much
higher than expected clock rate. In addition, some processors require multiphase
and nonoverlapping clocks with very stringent timing requirements. Also, clock
voltage levels are not necessarily TTL compatible, but may be much wider in
voltage swing. Microprocessor clock specs can be found on the device data
sheets and can be checked using conventional frequency counters and
oscilloscopes.


The microprocessor's power-up reset circuit can also cause fouled, but running,
system operation. A reset pulse that is nonexistent, too short, too noisy, or too
slow in transition can start everything off on the wrong foot, resulting in out-of-
sequence, partial, or no reset activity. Problems can also occur in reset circuits
that are susceptible to power supply glitches. Even when Schmitt input circuits
are used, slow edges can cause reset timing skew from one device to another
within some systems. This will cause some of the devices to power-up before the
others, resulting in erroneous behavior. A too rapid ON-OFF-ON system power
sequence will fail to restart many systems (e.g., the ,uLabl. It may then be neces-
sary to increase the OFF time to allow the power supplies and restart circuits to
discharge.


None of these reset failures will necessarily prevent the system from running. It
may run for a short time and then stop, or lock up in a meaningless program loop,
or even perform most of its normal operations. The key point to remember is that
the system must complete the power-up reset sequence to insure that all of the
test, control, and initialization operations necessary to bring the system up have
been performed.


Power-up reset circuits are normally operative only when the system is initially
powered-up. They can be monitored at that time with storage oscilloscopes, logic
analyzers, and in some cases, signature analyzers. They can also be manually
overdriven and controlled externally for testing purposes.


Lesson 18
Practical Microprocessors                                                             297
      Stuck or noisy interrupt lines can cause faulty system operation. The system may


## Page 324



      work with a stuck line but it will do so very slowly (spending most of its time
      servicing the "phantom" interrupt). Noisy interrupt lines can cause sporadic
      system changes to occur, or peripheral inputs or outputs may take place at
      improper times. Sometimes the system will not respond at all to certain I/O devices,
      which can occur when a higher priority interrupt has disabled the lower ones.


      Interrupt line activity can be monitored with a logic probe, logic analyzer, or
      oscilloscope. Interrupts are asynchronous in nature and can often be manually
      controlled (enabled or disabled) for testing purposes.


      The long parallel bus and control lines present in medium-to-Iarge micro-
      processor systems are sometimes susceptible to crosstalk and transmission line
      problems on critical lines (such as clocks and enables). These problems can
      show up as glitches on adjacent signal lines or ringing on the driving line
      (causing multiple transitions through a logic threshold). Either of these situations
      can inject faulty data or control signals that are very difficult to detect. This
      problem is most common when signal lines are long and already taxing the
      timing and noise margins of the system. When extender cards are added to these
      systems or high-humidity conditions exist, failures may occur. Cross-coupling of
      lines on extender cards can be a problem when fast signal transition lines i such
      as Schottky gate outputS) run alongside other signal lines, even when they are on
      opposite sides of a PC board.


      Memory failures in microprocessor systems can produce deviant system be-
      havior in a number of ways. Anything from a total system failure to a single faulty
      bit of stored data can occur. Most memory failures can be found during the
      power-up self-test program, unless the memory failure prevents this program
      from running. If the system doesn't do a RAM verification test and no RAM test
      service fixtures or procedures are provided, it is nearly impossible to test the
      RAM. You will probably need to resort to SUbstitution techniques when a RAM
      becomes suspect.


      RAM failures occuring in the area of the memory used for the stack will usually
      cause the system to crash, even for a single-bit error. Otherwise, RAM failures
      may cause soft errors that result in unreliable system operation. Faulty dynamic
      RAM refresh circuitry is another factor to consider in diagnosing apparent RAM
      failures.


      ROMs can also fail. Such failures are more frequent when nonmask program-
      mable types are used. A single bad bit could crash the system or, even worse,
      99 percent of it could work and 1 percent could produce erroneous results.
      ROMs can be effectively tested during power-up self-test, if such tests are


                                                                             Lesson 18


## Page 325




      Using Signa tu re A nalyzer to Tro ub les hoot Microp rocessor-Based Product


designed in. But, unlike RAMs, ROMs can also be tested by other techniques if
no self-test is provided. One such technique involves free-running the system
and then using the signature analyzer to either verify documented signatures or
compare the outputs of a suspected ROM with that of a ROM in a known good
system (see Experiment 17-2).


The programmability of microprocessor-based systems can be used to great                  SELF-TEST PROGRAMS
advantage in assisting system testing . Programs stored in the system 's ROM can
test ROMs, RAMs, and the processor itself. Often the I/O can be tested to some
extent. Software can also be used to provide sti mUlUS for an external test
instrument, such as a signature analyzer.

ROM Testing
The most common technique for testing ROMs uses a checksum. When the ROM
is programmed , all of its words are added together, ignoring any carries that
result. This number is complemented and stored in the last (or sometimes the
first) word of the ROM, so that when all the words are added together (including
the checksum stored in the last byte) , the result is zero. If the total is not zero at
the end of the test sequence, then something is wrong with the ROM. (In actual
practice, the checksum is usually calculated to make the total a specific number
other than zero. )

Unfortunately, the checksum is not totally reliable . It detects any single-bit error
and most multiple-bit errors; however, there are many combinations of two or
more errors that still produce the correct checksum. Thus, a ROM that passes a
checksum test is probably good . If the test fails, something is definitely wrong
(though it might not be the ROM itself) .


Lesson 18
Practical Microprocessors                                                                            299
                  RAMs are tested by writing a pattern into the memory, reading it back, and then


## Page 326


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


                  verifying that has changed. Of the many different patterns that can be used, a
                  common one is the checkerboard. In this pattern, all the bits are set to alternating
                  ones and zeros. Once all memory locations have been tested, the pattern is
                  repeated with each bit reversed, verifying that each bit of the RAM can store a one
                  and a zero. Many other patterns used to test RAMS are specifically aimed at
                  detecting various failure mechanisms within the RAM.

                  No memory test can guarantee 100 percent accuracy, even though it may show
                  that each bit can store a one or a zero. RAMs can be pattern sensitive. For
                  example, one location might correctly store 01010101 and 10101010 but fail when
                  01111000 is stored. Even for a small RAM, it would take an extremely long time to
                  test every possible pattern sequence. For this reason, RAM test credibility is
                  generally much lower than that of ROMs. As with the checksum test, if a RAM
                  passes the system self-test program, it is probably good. If it fails the test,
                  something is definitely wrong.


                  Multiplexed keyboards and displays often share some of the same scanning
                  circuits (as does the flLab). In these situations a stuck key can appear to make
                  the display fail. Likewise, a bad display driver input could cause a keyboard error.
                  The interaction between common scan circuits must be considered in making
                  a diagnosis.


                  Many microprocessor systems interface with other systems through external
                  communication lines (e.g., IEEE-488, RS-232C, telephone modem). These lines
                  are frequently long and are often exposed to sources of electrical interference,
                  such as relays, transformers, motors, solenoids, and even lightning. Electro-
                  magnetic interference (EMI) emanating from these sources can cause the trans-
                  mission of faulty data, overstressing of interface circuits, and, especially in the
                  case of lightning, gross component failures. Generally, output line driver circuits
                  tend to have higher-than-average failure rates, due both to EMI stressing and to
                  the high transition currents that result from driving capacitive interfacing cables.


TROUBLESHOOTING   A troubleshooting tree is a graphical means of showing the sequence of tests
          TREES   performed on a product under test. These trees are often drawn as flowcharts in
                  which the results of each test determine what step is taken next. The use of
                  troubleshooting trees for repairing microprocessor-based products can save
                  considerable time and effort.

                  Figure 18-1 shows a portion of the troubleshooting tree for the HP 3455A Digital
                  Voltmeter. Theoretically, it should lead you to the product's fault by means of the
                  actions taken and decisions made along the tree. Unfortunately, such is not
                  always the case. A perfect troubleshooting tree must consider all possible fail-
                  ures, a difficult criterion for the person writing the troubleshooting tree to meet.
                  Also, troubleshooting trees tend to be fairly generalized, lacking the specifics
                  desired for making tests and decisions. Few troubleshooting trees provide practi-
                  cal information about how a specified test or measurement relates to what the
                  circuit does or is supposed to do. If the troubleshooting tree fails to direct you to
                  the actual fault, you may be left at a dead-end, with no idea of where to go next.
                  However, the troubleshooting tree will often be your best guide (at least to
                  begin with 1.


                                                                                          Lesson 18
 300                                                                      Practical Microprocessors


## Page 327


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



                                    Check The Signatures At
                                    Th e Followln \l POlllt S

                                    L oca t ion   Signat LJrt?
                                    A1 U 2 1
                                    Pin 2         8CPU
                                    Pi n 5        UPUH
                                    Pi n 9        2 131
                                    Pi n 12       H A F7


                                                                            Output Buffer A 1 U 2 1


                                    Check Th e Sign atures        At
                                    The Following Po i nts

                                    L ocation     Sig nature

                                    A1 U2 9
                                    P,n 2         UC H 6
                                    PHl 5         8 7 C2
                                                  H07 4


                                                                          I nput   Latch   A 1 U29    Or
                                                                          ALU A1U28 .


                                    Check The S ignatures         At
                                    The F ollow i ng Points ·

                                    L ocation     Signa ture
                                    A 1 U25


  Figure 18-1.    Typical Troubleshooting Tree for Product Incorporating Signature
                  Analysis


There are good troubleshooting trees and there are bad troubleshooting trees.
The good ones seldom lead to a dead-end and provide a logical, well-directed
sequence of tests and measurements, requiring a minimum level of under-
standing of the circuit under test. Often they include advanced techniques such
as signature analysis to simplify the procedure. In troubleshooting a product,
even the poorer troubleshooting trees can be useful for localizing a failure area
in the system and can save considerable time and effort.


For many experienced troubleshooters, working from product block diagrams                                  OTHER
can supply the right amount of information to understand how the different parts                           DOCUMENTATION
of the circuit work together. A product's theory of operation and its trouble-
shooting trees do not relate as closely to the hardware. The schematics often
provide too much detailed information, making it difficult to see the "big picture."

The remaining portion of this lesson outlines a loose sequence of general steps
that you can take to troubleshoot a microprocessor-based product. Numerous
servicing techniques and "tricks of the trade" are interspersed with the
descriptions.


Lesson 18
Pract ica I M i c ro p rocesso rs                                                                                     301
                                  It is important to have a general understanding of the defective product so that


## Page 328



           I •• : .... ~" . " .
                                  you can be sure that a problem really exists. To some degree, you should know
                                  what it does and how it operates. Microprocessors allow designers to design
                                  products that are not only complex in function, but sometimes complex to oper-
                                  ate as well. Be sure the apparent problem is not a user error, but a real product
                                  malfunction. Few things are more frustrating than trying to fix something that is
                                  not broken. In some situations, it appears that a product should do something it
                                  was not actually designed to do. For example, a DVM AC select switch may work
                                  on VOLTS but not on AMPS. This "design limitation" can usually be verified in the
                                  operating manual and does not constitute a product malfunction; it is only a
                                  shortcoming.

                                  Design "bugs" in the firmware (ROM) can sometimes cause failures when used
                                  under operating conditions that were not anticipated during the product design.
                                  These are more likely to occur in early production runs and can best be verified
                                  (if suspected) by contacting the manufacturer. At the other extreme, a problem
                                  may actually exist but not show up because the product is not adequately
                                  exercised. These kinds of problems are often very simple to detect (e.g.,
                                  observing a burnt out OHMs LED indicator when pushing the OHMs button on a
                                  DVM). They can also be complex problems. For example, errors can occur when
                                  an unusual sequence of operations is performed. Because the complex problems
                                  are much more difficult to test for, extensive test procedures are used to test
                                  products at the factory. The customer, bringing in a product for repair, has no
                                  trouble pointing out a problem. It is up to the troubleshooter to solve it.


     WHAT CAN BE                  A great deal of diagnostic information can often be obtained without even
                                  removing the product's covers. Most microprocessor-based products have some
LEARNED FROM THE
                                  sort of front panel. On it there may be switches and indicators, inputs and outputs.
    FRONT PANEL?                  Milking the front panel is a process in which the switches, buttons, and other
                                  inputs are used to solicit responses from the product that can be observed using
                                  its indicators and other outputs. For instance, if the indicators are all dead when
                                  the power is turned on, you might suspect a bad switch, fuse, power cord, battery
                                  connection or power supply. If one segment of a display is dead, the problem is
                                  probably the display itself or the circuit that drives it. If the only failure of a DVM
                                  is in the HO VOLT range, the problem area can be narrowed down to a relatively
                                  small portion of the circuit (the attenuator).

                                  Always take advantage of any designed-in performance verification or power-up
                                  test modes and diagnostic messages that are available. These are specified in the
                                  product manual.

                                  At this point you may have some idea of where the problem is or you may have
                                  even fixed it. But in all likelihood, neither has taken place.


  WHAT DOES THE                   "If all else fails, look at the manual." This rather poor (but prevalent) attitude
    MANUAL SAY?                   makes even less sense for microprocessor-based products than for conventional
                                  ones. There may be a bonanza of service aids and procedures in the manual just
                                  waiting for you to try out. Special service switches, jumpers, test fixtures, indi-
                                  cators, and test techniques can make the job much easier.

                                  Try to understand the circuits and figure out where things are. Check out the
                                  manual's theory of operation section, the block diagrams, and the schematics.


  302                                                                                      Practical Microprocessors


## Page 329




You do not have to do this in great detail but just enough to have some idea of
what is going on . Identify the microprocessor, RO M, RAM , 1/0 , address decoder,
clock, bus, co ntrol , and interrupt portions of the system.


The life of an IC is generally a sequence of predictabl e events. It is born in the IC      PRODUCTION VERSUS
factory an d is sent to a product manufacturer. There it is inserted into a circuit         FIELD FAILURES
board, which in tu rn is inserted into a prod uct. Then the product goes into
service , an d the IC remains there for the rest of its useful life. Needless to say, not
all ICs live a long and health y life.

Product man ufacturers estimate that approximately 2 percent of all incoming ICs
are defective. Testing incoming ICs on an IC tester will detect most of these. The
effective cost of fin ding a defective IC at th is point is about 10 cents. Once ICs are
load ed in to circu it boards, the bad ones cost about $1 to find . If they are not
detected until th e boards are assemb led in to the end prod uct, this "in-situ "
tro ubleshooting and repair costs about $10 at the factory. Replacing a bad IC in
the field is even more expensive: a typica l bill for finding and replaci ng a faulty IC
in a customer's product is about $100. Clearly, it makes sense to find and elimi-
nate the defective ICs as early in the cycle as possible .


                          .- _..

                             I·


         HP 5045A Digi tal Ie Tester Use d to Perform In co ming In spec tio n


Types of Failures
Common fault sou rces and th e best troubl eshootin g techni ques for finding them
depend on the history of th e prod uct and the envi ron ment in wh ich it is tested .
When a new prod uct is fi rst turn ed on at the factory, al most anything might be
wrong with it. Prod ucts that fail in t he field have all worked at one time. Assembly
errors, such as misloaded components and miswired circuits, generally need not
be considered in field failures. Also , the likelihood of solder shorts and multiple
faults is much greater on the production line than in the field . Field failures are
usually caused by components or connections that have failed .


Less on 18
Practical Mic ropro cessors                                                                            303
                    Automatic Testers


## Page 330



                    Because of the volume of identical products tested at the factory, specialized
                    testing and troubleshooting equipment and techniques can be justified . Auto-
                    matic board testers and test fixtures are often used to minimize the time it takes
                    to locate faults. In general, they provide fast, economic, and accurate verification
                    and fault diagnosis. Do not, however, fall victim to overconfidence in computer-
                    controlled automatic board testers. Occasionally, boards passed by a production
                    board tester are actually defective as a result of deficiencies (timi ng , loading, or
                    component exercising) in the tester or the test program being run . However,
                    newer board testers that perform more sophisticated dynamic, functional , and
                    parametric tests have greatly increased credibility.


                    HP 3060A Board Test System Performs Fast, Thorough , and Efficient Testing in Pro-
                    duction Environment


WHAT ARE THE EASY   It makes sense to look first at the things that can be tested and repaired easily.
  THINGS TO TEST?   The simple things are as li kely to fail as the complicated ones. A case in point is
                    the power supply: it is actually one of the more failure-prone portions of most
                    products. It is also one of the easiest to test and is usually simple to troubleshoot.
                    An out-of-spec voltage can cause erratic circuit performance. If the voltages are
                    not checked first, it could take considerab le time to find the problem .

                    A mechan ical inspection can also be fruitful. Poor PC board and cable connec-
                    tors, broken wires, and loose parts can usually be found either visually or by
                    touch.


        COMMON      A number of common sou rces of failure in a manufacturing environment can be
 PRODUCTION-LINE    found through careful visual inspection of a product's circuit assemblies. It is easy
                    to check for improperly set switches and jumpers, misloaded components
TROUBLESHOOTI NG
                    (wrong ones and backward ones), and cold solder joints. Backward resistor
       PROBLEMS     packs can be particularly hard to diagnose electrically because they can cause
                    interaction between unrelated logic nodes, but they are easy to check visu ally.

                    Two of the more common failures in production are solder and gold (copper)
                    shorts on printed circuit boards. These can usually be removed with a sharp knife.
                    When the precise location of the short is not known , there is a rather novel
                    technique for removing it that often works. It is also useful for situations in which
                    the location of the short is not accessible (such as inner layer shorts on multi-
                    layer boards ). The procedu re involves charging a 100,000 J..LF (or larger) capacitor


                                                                                             Lesson 18


## Page 331


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



to five volts (a safe voltage for logic circuits). Then, with cables solidly connected
to the two shorted nodes and proper polarity observed, discharge the capacitor
into them and listen for a snapping sound on the board. Check continuity to see
if the short has been opened and, if not, try again. This technique should be used
with caution since it will open the weakest link of the current path, which may not
always be the fault source, but may be a fine trace or a plate-through. The current
tracer provides a much safer means for finding shorts, as demonstrated in
Experiment 16-4.

A relatively new problem in production is the occurrence of bent-under IC pins
caused by automatic component insertion equipment. These can result in an
open electrical connection between the IC and the PC board, an intermittent
connection, or shorts to traces near or under the IC. The bent-under pin is often
difficult to spot visually because it may look as though it is properly soldered in
place. The best way to tell is to look at the bottom of the board for the ends of any
IC pins or along the plane of the board to see under the ICs.

PC board edge connectors are commonly used. They may cause problems in
production when their borders are cut off center or when they are accidentally
covered with solder resist or board sealing spray. Visual inspection can reveal
such problems.

Multilayer PC boards suffer from all of the problems of regular boards plus some
of their own. Misregistration and contamination of inner layers (which can cause
high frequency or leakage problems) can often be observed by holding the board
up to the light. Since repair of the inner layers is often impossible, the entire board
may have to be scrapped.

Wire-wrap boards are prone to bent posts that cause shorting. Other common
production problems include 14-pin ICs loaded into the wrong end of a 16-pin
socket, miswiring, wire shorts between pins, and signal coupling (crosstalk) due
to closely bundled wires.


Visual inspection of a product that fails in the field can reveal such things as loose
wires, broken traces, cracked ceramic ICs and resistor packs, bent wire-wrap
posts, and dirty connectors. A "calibrated fist" on the side of the cabinet can often
be used to detect loose or intermittent connections and stuck relays. Mechani-
cally stressing boards and connectors (by twisting and flexing) can often help to
locate some of these problems. You might suspect the PC board edge connectors
when a product is "O.O.A." (dead on arrival) or fails in a hostile physical environ-
ment. You may want to try reseating all of the assembilies and circuit board
connections to determine if the problem is poor connector contact. A pencil eraser
is useful for cleaning dirty edge connectors.


Board Swapping
If any of the PC boards are easy to remove and replace and known good ones are
at hand, you can try swapping them. When duplicates of the same board or
assembly are used in one product, they can be swapped with each other. The risk
involved in board swapping is that you could damage a good board because of
the same electrical overload that damaged the bad one when it was installed. In
any case, power to the product should be turned off when removing or installing
boards or assemblies.


Lesson 18
Practical Microprocessors                                                                 305
      If an identical product is available, functional comparisons can sometimes be


## Page 332



      informative. This comparison can be especially useful in situations in which it is
      not clear that there is actually a hardware problem (it may be a product
      idiosyncrasy or design limitation) .

      If a device in a socket is suspect, try tapping it first to see if there is a loose
      connection and then try substituting a known good one. Note, however, that one
      of the last devices you should suspect, but that is most often the first to be
      replaced , is the microprocessor. The actual failure rate for microprocessors is
      very low. However, because they are complex and their correct operation is
      difficult to verify, they are often the first to be plucked from a PC board. This is
      also true of the LSI chips used with them.

      Stress Testing
      A technique referred to as stress testing can be very effective in dealing with
      marginal or intermittent failures. Stress testing can often cause these types of
      failures to temporarily improve or deteriorate; either case is beneficial in locating
      a fault. Boards are stressed physically by tapping or twisting them, thermally by
      heat (air gun or hair dryer) or by cooling them (from an aerosol freeze can) , and
      electrically by varying the supply voltage. Thermal stressing can be used to
      isolate a fault in a specific device on a board more precisely than the other
      methods because heat or cold can be applied directly to a single component.
      Intermittents can result from marginal chips, lead bonds, solder joints, connec-
      tions, and drive and timing circuits.


                    Cold Spray Helps Identify Faulty and Marginal Devices

      Briefly touching each device on a circuit board can pinpoint a component that is
      running hot (much hotter than the others). When a particular device runs signifi-
      cantly hotter than others of the same type, a problem may exist. A faulty device


                                                                              Lesson 18


## Page 333


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



can sometimes be hot enough to burn your finger, so use this technique with
caution. Be aware also that some good devices may run hotter than you expect
during normal operation, and that temperatures may vary widely from one device
to another.

Power Supply Shorts
There are some effective ways of dealing with shorts across the power supply.
The first thing to do in a multi board system is to try to localize the short to a
single board. This can be done by removing one board at a time until the power
supply is no longer shorted. The last board to be removed is the shorted one.

One technique for finding the short on a faulty board is to inject current through
the two shorted lines with the logic pulser. The current tracer is then used to
follow this current to the short. Keep in mind that capacitors (especially electro-
Iytics I will have some current going into them because of the pulsing current.
Shorted capacitors can be found by using the current tracer to compare the
current levels going into identical capacitors on the same board. The capacitor
that shows a much higher level than the others is likely to be shorted. This tech-
nique is particularly useful for finding shorted ceramic bypass capacitors.


Another technique for locating power bus shorts is to supply a relatively high
current (about 3-5 Amps) into the short. Be sure to maintain the same voltage
polarity and not to exceed the supply voltage normally present. The current path
to the short can often be determined by using a DVM with high resolution
( .01 mVI to look at voltage drops on the power bus traces. Voltages are developed
across the traces that are in the path going to the short, and not elsewhere (see
Figure 18-2).

                                DVM                           DVM


  t      3-5 Amps


       Figure 18-2.   Using Sensitive Voltmeter for Locating Power Bus Short

A less scientific, but much more dramatic, technique for finding power bus shorts
is to freeze the entire board (to about -10 degrees C), allow moisture to condense
on it, and then power it up with a 3-5 Amp supply. As it warms up and defrosts,
the current path becomes visible and, in many cases, will pinpoint the short.


Once the easy things have been tried unsuccessfully, it is time to get down to        HOW CAN THE FAULT
business. At this point individual troubleshooting skills, intuition, and knowledge   BE ISOLATED?
of the product really make a difference.


Lesson 18
Practical Microprocessors                                                                        307
      First, be sure to take advantage of any designed-in and documented circuit isola-


## Page 334



      tion features, such as selected board removal, service jumpers, and special test
      modes and procedures. It can be very useful to separate the microprocessor
      system from the peripheral circuits to allow you to diagnose each portion
      independently.

      An important troubleshooting concept is half-splitting. Although the term may be
      new to you, you've probably been using the process for years without even
      knowing it. Half-splitting involves choosing a point roughly in the middle of the
      circuit. It is just as likely that a fault exists before as after that point. If the perform-
      ance is correct up to that point, the fault lies after it. If not, then the fault is before
      that point. This process works best in circuits that have clear, unidirectional signal
      paths without large feedback loops. Even with microprocessor-based systems,
      this approach can be effective because the circuits outside the microprocessor
      portion often fit these guidelines.


      In a typical product, the first half-split is generally done at the digital-to-analog
      interface, if possible. Analog circuits often have higher failure rates (due to higher
      demands made on speed, power, temperature, sensitivity, accuracy, adjustment,
      external overloads, and reduced component safety margins). The contribution
      of a product often relates to its analog circuits. These are often the circuits that
      represent the "high-technology" contribution and that may be operating near
      their limits. They may also outnumber the digital ones. Be aware also of the
      possibility of the electrical interaction of clock and TTL power bus lines with
      analog circuits, which can cause serious system noise problems.


      When suspicion falls on the digital portion, the first thing to look for is signal
      activity. With a logic probe you can examine activity on the clock signals, bus
      lines, chip enables, and control lines. Absence of activity on any of these nodes
      indicates a possible problem. You may wish to refer back to Experiment 16-1 to
      refresh your memory about troubleshooting with the logic probe.


      The most common failure mode for digital ICs is open lead bonds inside the
      package. There are thin wires connecting the package pins to the IC chip. If an
      output lead bond opens, the output pin floats and the logic probe will probably
      indicate a constant floating logic level because of other device inputs connected
      to that node. If an input lead bond opens, one or more of that IC's outputs will
      usually appear to malfunction (stuck high, low, or executing its logic function
      incorrectly). If any of these outputs goes to a three-state bus, it can cause bus
      conflicts (more than one output on at a time), and the current tracer can be used
      to find these. Bus conflicts are often observed on an oscilloscope by the presence
      of bad, but solid, logic levels on bus lines, but the scope provides no information
      as to the source of the fault (see Figure 18-3). Good bus lines can also appear
      to have solid, bad levels present when all devices on the bus are off.


      Another common digital IC failure is a shorted input pin to ground. This fault is
      often caused by a bad input protection diode on the chip. It usually appears as
      a stuck low level, which can be seen with a logic probe. An oscilloscope con-
      nected to a node with this type of problem shows a voltage level near ground
      being pulled up, perhaps a few hundred millivolts, whenever a logic 1 output on
      that node turns on (see Figure 18-4). The current tracer provides an excellent
      means of pinpointing shorted input pins.


                                                                                   Lesson 18


## Page 335


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



                I
                I


                !


                I


                                                                           1 V/ div


         0V


          Figure 18-3.   Bu s Conflicts Cause Bad, Bu t Solid, Logic Levels


                                                                  c:::     200 mV/ div
        0V                                   .......

 Figure 18-4.   Sho rted Subst rate Diode on Gate Input Pin Clamps Node to Ground


If a current tracer is not available, another means for locating stuck inputs and
outputs involves the use of a sensitive (high resolution) DVM and a can of cold
spray. Connect the DVM to the stuck node and select the most sensitive DC
voltage range available. Then, while monitoring the voltage, spray each IC
connected to the stuck node, one at a time, to change its temperature. Any
noticeable change in voltage (more than 10 mV) on the node indicates that the IC
being sprayed is drawing current. If a freeze can is not available, a heat source
can be used instead. This technique relies on the properties of the semiconductor
material used in the IC that relates voltage to temperature.


Lesson 18
Practical Microprocessors                                                                309
                 Once a particular input or output pin is suspected, it is useful to isolate it from the


## Page 336


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


                 rest of the circuit. A quick, nondestructive way to do so is to suck the solder away
                 from the area between the pin and the PC board pad, using a vacuum desoldering
                 tool or solder wicking braid. Then bend the pin so that it is centered in the pad's
                 hole, not touching it at any point. Use a continuity tester to verify that the pin is
                 no longer in electrical contact with the board.


                 The techniques that you can use to isolate the digital blocks of a microprocessor-
                 based product are entirely dependent upon its electrical and mechanical archi-
                 tecture. If some of the digital boards can be removed and still allow the kernel to
                 operate, this procedure can be useful. If the kernel can be allowed to run open-
                 loop (no feedback from the data bus), a free-run mode can sometimes be used
                 to check the kernel and address bus activity.


                 An extender board with switches on bus and signal lines can be used to break
                 selected signals between a PC board and the rest of the system. In this manner,
                 feedback paths and stuck buses can be removed from the main system.


                 An even simpler way to open selected signals going through a board edge
                 connector is to place a piece of tape or stiff paper on the PC board edge fingers
                 that you wish to isolate. Be careful to note to which board(s) you have done this
                 to so that you will remember to remove the tape or paper later.


                 A somewhat unconventional, but often effective means of detecting bus line
                 problems is to measure the resistance to ground (with the power off) of each of
                 the bus lines in a particular bus (e.g., data bus, address bus). The resistance of
                 each of these lines is usually the same. If anyone differs substantially, you may
                 suspect a problem on this line. If two lines show the same (lower) resistance, the
                 two lines may be shorted together. In either case, check the schematic to see if
                 the arrangement of circuits connected to these lines could explain the differences
                 before going further.


                 Overriding interrupt lines and chip enable pins on suspected devices can be used
                 to verify that the IC is functioning correctly. This can be done by momentarily
                 shorting the appropriate pin high or low, or by using a logic pulser (refer to
                 Experiment 16-2).


FEEDBACK LOOPS   Digital feedback loops are often difficult to troubleshoot because errors propa-
                 gate around and around. A feedback loop with a faulty output signal sends this
                 Signal back to the input to produce more bad outputs. Opening this feedback
                 path prevents the faulty output signals from going back to the input. Then, if
                 controlled inputs to the loop can be generated, the signal flow from the input to
                 the output can be observed. Often, however, it is not easy to provide this input
                 (many lines may need to be controlled). It may also be difficult to predict correct
                 circuit operation. If another working product (or board with the same circuitry)
                 is available, it is sometimes practical to allow the output of the good circuit to


                                                                                          Lesson 18
310                                                                       Practical Microprocessors


## Page 337




control the inputs of both circuits. In this manner, you know that the circuit under
test is getting the correct input signal. It is then a matter of comparing the nodes
of the two circuits and looking for differences. A signature analyzer can be useful
for doing this comparison .


Piggy-backing ICs is a technique that can sometimes be used to locate defective
ICs. It involves looking at suspicious IC outputs with an oscilloscope or signature
analyzer and then placing an identical IC package directly on top of it. The pins
should be bent slightly, if necessary, so they are all in contact. A signal change
can indicate problems with that device. If no change is observed and the output
is not stuck, it can generally be assumed that the IC is not the problem . Be cau-
tious of sequential circuits (such as counters and shift registers ) that may cause
output differences because of start-up conditions. A better way of performing this
test is to use an IC comparator, such as the HP 10529A Logic Comparator.


HP 10529A Logic Comparator Performs In-Circuit Logic Device Comparisons to
Known Good Reference


Lesson 18
Practical Microprocessors                                                              311
      CONCLUSION   No amount of knowledge and experience can totally compensate for inadequate


## Page 338



                   service documentation. In some cases, shotgunning (replacing components until
                   the problem disappears) may be the only solution . Most microprocessor-based
                   products, fortunately, do not fall into this class. Future products will probably
                   incorporate advanced service techniques, such as signature analysis, as more
                   designers realize that the old troubleshooting methods and tools used for random
                   logic are not very effective in dealing with microprocessors.


                               Occasionally Shotgunning Produces Unfavorable Results


                                                                                          Lesson 18


## Page 339




                                                                                       Lesson 18


Microprocessor systems can be thought of as an extension of traditional digital
logic. Many of the components, circuit designs, and troubleshooting tools and
techniques are the same. However, there are some differences. Microprocessor
systems are bus structured, and many of the devices on the bus are complex
LSI devices. The signal activity between the devices on the buses is constant and
complex. It is often useful to break the data bus, which is the system's main
feedback path, to help isolate a fault that causes the entire system to malfunction.

Although troubleshooting trees provide an orderly approach for locating system
faults, they are not always adequate. There are numerous techniques, procedures,
and tricks that can be effective in diagnosing, isolating, and locating faults in
microprocessor-based products. Many of these were discussed.


Lesson 18
Practical Microprocessors                                                                     313
i/\1117 ____________________________________________________________________________


## Page 340



~~i~I!L-


Lesson 18


                     1. In microprocessor buses, oscilloscopes are least effective when looking for:
                        a. improper data.
                        b. faulty logic levels.
                        c. timing problems.
                        d. bus conflicts.


                     2. The most effective tool for finding the defective device on a stuck bus is the:
                        a. signature analyzer.
                        b. logic analyzer.
                        c. oscilloscope.
                        d. current tracer.


                     3. A potential problem with troubleshooting trees is that:
                        a. they are hard to follow.
                        b. they have termites.
                        c. they require too much knowledge of the product.
                        d. they may lead you to a dead-end.


                     4. The first troubleshooting step should be to:
                       a. read the product service manual.
                       b. check the fuse and power cord.
                       c. shake the product and listen for rattles.
                       d. determine the nature of the problem.


                     5. A key requirement for half-splitting is:
                       a. unidirectional signal paths.
                       b. SA test modes.
                       c. board swapping.
                       d. having a good comparison product available.


                     6. The most common failure mode for digital ICs is:
                       a. a wrong chip in the package.
                       b. a shorted input diode.
                       c. an open lead bond.
                       d. a bad output logic level.


                                                                                           Lesson 18
314                                                                        Practical Microprocessors


## Page 341


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



_ _ _ _ _ _ LESSON 19
                                                                    Troubleshooting the
                                                                     Microprocessor Lab


This lesson describes the troubleshooting flowchart for the }1Lab and shows how           INTRODUCTION
to find a fault using this flowchart. You will then insert and find faults on your own.
Because the }1Lab is a complete microprocessor system, most of the types of
failures discussed in the previous lesson can occur in it. The troubleshooting
strategy for the }1Lab is therefore similar to that for many other microprocessor-
based systems.


Figure 19-1 shows the troubleshooting flowchart for the }1Lab. It makes use of the        THE
designed-in self-test and signature analysis features. This flowchart provides a          MICROPROCESSOR
useful guide for directing the tests and measurements necessary for locating a
                                                                                          LAB
circuit fault.
                                                                                          TROUBLESHOOTING
Is There a Problem?                                                                       FLOWCHART
This question is not as trivial as it may seem. There are several faults in the }1Lab
that do not cause obvious malfunctions. Some examples are power-up failures,
the inability to store data in memory, the inability to properly execute the ECHO
demo program that is stored at address 0407, and partial keyboard failures.

Does It Power-Up?
The }1Lab contains a power-up performance verification program that is run
whenever power is first turned on. The most obvious occurrences during this test
are the momentary lighting of all output LEOs and display segments, the beeping
of the speaker, and, finally, the u L R b       L/ P message in the display. If you
obtain all these results, you can assume that all is (reasonably) well. In addition,
tests are run on the ROM and the two RAM chips during this program. If a prob-
lem is detected, a display message may result, giving the IC designation number
(IC4,5 or 6) of a possibly bad ROM or RAM. The mere fact that the }1Lab is able to
go through this power-up program sequence and control the display tells you
that the basic microprocessor system (microprocessor, ROMs, RAMs, decoding
and control circuits, and buses) is working to a substantial degree.

Lights On?
If the }1Lab fails to power-up and none of the LED indicators light. the power
supply or primary power source should be suspected.


Lesson 19
Practical Microprocessors                                                                            315
      Bus Activity?


## Page 342


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


      If the power supply is good, then the next logical test is to determine the presence
      of activity on the data and address bus lines, using a logic probe or signature
      analyzer probe. Lack of activity would explain the failure to power-up and could
      be caused by a faulty clock. Or, an incorrect logic state could be present on the
      Reset, Hold, or Ready inputs to the microprocessor. If these lines are good, or if
      one of them is bad but you cannot easily tell why, continue on to the next step.
      A faulty ROM could also cause a HALT instruction to be executed, causing bus
      activity to stop.
      SA Test Loop Working?
      This point in the procedure is basically a half-split (described in Lesson 18). The
      signature analysis test loop requires more of the circuit to operate than the
      free-run modes need. Try to get the j.1Lab into the SA test loop by pressing the
      RESET key and then sliding the SA switch up and down once. If it is working, all
      of the output LEOs and display segments light and the speaker beeps once.
      Pressing the INTRPT key also causes the speaker to beep repeatedly. If most of
      these actions occur, the SA loop is probably running. The best way to be sure is
      to connect the signature analyzer to the j.1Lab and check the Vcc set-up signature
      specified in Table C-3 or C-4 (the write or read SA test loop).


                                                            leave
                                                           It Alone


                                                           Check
                                                           Power
                                                           Supply


                                                        Check: Reset,
                                                       Hold, Clock, and
                                                         Ready lines


                                      S.A.                                                Check Data
                                                No                          Free-Run
                                                                            Working
                                                                                          and Control
                                                                               ?          lines at liP

                                         Yes                                       Yes


          Check S.A.                           Write                         Check
                                                         Check S.A.
          Read Table                                                        Free-Run
                                                         Write Table
                                                                          Address Table


                                                                              Check
                                 Check S.A.
                                                                          Free·Run ROM
                                 Write Table
                                                                              Table


                       Figure 19-1.     Microprocessor Lab Troubleshooting Diagram


                                                                                          Lesson 19


## Page 343




If the SA test loop runs, you know that the essential portions of the system are
operating satisfactorily. The microprocessor is addressing the ROM, is receiving
instructions from the ROM through the data bus, and is executing those
instructions.

There are two stimulus programs in the SA test loop. One of them writes stimulus
patterns to the devices that the microprocessor talks to, and the other reads data
from the devices that the microprocessor listens to. Both of these programs run
alternately while in the SA test loop. By changing the connections to the
signature analyzer, either the talking or listening devices can be checked.

The symptoms of the fault often point to a general portion of the circuit and are
classified as a read or a write type of problem. For example, a faulty display is
most likely to be a write problem. The signature analyzer is then connected
according to the set-up specified in the SA write loop table (Table C-3).
Signatures on nodes in the display circuit are then checked against entries in
that table.


When the SA test loop will not run, you need to test smaller portions of the circuit.
Opening the data bus lines to the microprocessor (by sliding the eight BUS
SWITCHES Up) and inserting a free-run instruction (by sliding the FR switch up I
causes the microprocessor to cycle through the address space on its own. Opening
the data bus lines allows you to isolate the microprocessor from the data bus and
the rest of the system. In the free-run mode, the microprocessor stimulates other
portions of the circuit through the address bus. This address bus stimulus is un-
sophisticated compared to the well-controlled data patterns used in the SA test
loop. However, the free-run mode does exercise portions of the address bus drive
and the decoding and control circuits, as well as the ROM. The advantage of this
test mode is that, in order to use it, little more than the microprocessor chip has to
work.

The free-run test mode can be identified by the action of the bus and status LEOs
on the ~Lab. The fourteen least-significant (right-most) address bus LEOs should
be flashing so rapidly that they appear to be steadily lit. The A15 and A14 LEOs
should appear to flash rapidly. The status LEOs should behave as follows: READ
on, WRITE off, and ROM, RAM, INPUT, and OUTPUT flashing.

If the microprocessor will not free-run, check the control lines going to it (Reset,
Hold, Ready, and Interrupti and the clock to see if one of these is the cause. You
can check the power-on reset circuit by forcing its output on (low). You might also
check the data bus pins at the microprocessor to see whether it is getting the free-
run instruction. If these signals all appear to be correct, the microprocessor is prob-
ably defective. There are few other factors that could keep a properly powered and
controlled microprocessor from free-running.


The free-run address test mode allows you to exercise most of the address and
control circuits in the ~Lab. Table C-1 shows the set-up and signatures. A correct
Vcc signature verifies the proper test set-up and free-running of the microprocessor.

When the ~Lab is free-running correctly, the address bus and much of the
decoding and control circuits can be tested. The first signatures to look at are
those on the address bus lines. They should all agree with the signatures in


Lesson 19
Practical Microprocessors                                                                 317
      Table C-l Signatures on the device chip select pins, the address decoder (IC?),


## Page 344



      the other control circuits, and the microprocessor (IC3) control pins can then be
      taken. If all of these signatures are correct, you can assume that the address,
      decode, and control portions of the system are probably good. However, if you
      have suspected other problems as well, you could check the remainder of the
      signatures in Table C-l If all these signatures are correct, you should suspect a
      bad device on the data bus and go on to the free-run ROM test mode.

      Free-Run ROM Test Mode
      The free-run ROM test mode requires a different set-up from the free-run address
      mode so that it samples data only when the ROM is being addressed. In this way
      the contents of the ROM can be verified and faulty data bus lines can be detected.
      Either of these conditions could prevent the j.1Lab from running the SA test
      program (or any other program).

      The procedure for testing the ROM is to first connect the signature analyzer to
      the j.1Lab according to Table C-2 (while still in the free-run test mode). Verify the
      set-up by checking the Vcc signature. Then check each of the eight data bus
      lines. A faulty signature on anyone of these lines should be checked at the
      corresponding ROM output pin to determine whether the problem is a ROM
      output or a board trace. If bad signatures are found on all of the bus lines, the
      ROM enable and address signals should be checked at the ROM pins. If these
      signatures are good, then another device may be erroneously enabled onto the
      data bus, creating a bus conflict. Signatures on the other bus device enable pins
      can identify this problem. If these signatures are good, the system can be stopped
      while the ROM is enabled. The logic pulser and current tracer can then be used to
      find the offending bus device I refer to Experiment 16-41.


                                                                             Lesson 19


## Page 345


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



_ _ _ _ _ _ _ _ _ EXPERIMENT 19-1
                                  Familiarization with the Fault-Finding Process


   CONCEPT
   In this experiment, you will insert a fault into the ,uLab and then follow the troubleshooting tree, making
   observations, measurements, and decisions until the fault is found . In the process of find ing this fault,
   you will gain familiarity with the tools and techniques used for troubleshoot ing the ,uLab.


   PROCEDURE
   I.   Setting the Fault
        A) Verify that the ,uLab is fault-free prior to inserting the fault. To do this, simply turn the power off,
            wait a second, and then turn it back on again . The display shows u L R b              UP, and you
            know that no major faults are present.

        S) Locate fault jumper W1 in the upper center portion of the board (see Figure 19-2). Notice that it
           is plugged into the left two holes of a series of three holes. Remove and then re-insert it into the
           right two holes. Observe that the display goes blank or contains stuck digits. For the rest of this
           experiment forget, having ever touched jumper W1 .

        C) Now you've done it. You have broken it and cannot remember what you did , right? Read on to see
           what to do next.


                 Figure 19-2.   Location of Fault Jumper W1 and Address Bus Test Probe Holes


Lesson 19
Practical Microprocessors                                                                                             319
EXPERIMENT 19-1 _ _ _ _ _ _ _ __


## Page 346



(Continued)


      II. Diagnosing the Fault
          A) The ,uLab has power-up, self-test, and diagnostic capabilities designed in, so try turning it off
             and then on again. Maybe it will tell you what is wrong by displaying a message.

          B) No such luck. Press    E) .   Still nothing. Press some other keys. Now try to see how bad it is. Are
              any lights on? Yes. That means the power supply is probably all right. Are the address and data
              buses doing anything? Yes. Do not always rely on the LEOs on these buses to show you activity.
              You cannot see them blinking if the frequency is very far above 30 Hz, a pretty slow rate for a
              microprocessor.

          C) Now is the time to reach for the logic probe. Connect its power leads to the power slots at the
             top edge of the board (see Experiment 16-1). The probe tip should light. Set the slide switch on
             the probe to the TTL position.

          D) Place the probe tip into test probe holeAO (refer back to Figure 19-2). The flashing tip tells you
             there is activity on the AO line. The probe converts the fast activity (data stream) at its tip to a rate
             slow enough for you to see.

          E) To determine whether there is bus activity, probe the other 15 address lines, as well as the data
             lines DO through 07.

          F) Since there is activity on all of these lines, you know that none of them is stuck high or low.
             This tells you that the microprocessor is trying to do something.

         G) It is apparent that the microprocessor cannot make the whole system operate, but maybe the
            internal signature analysis test loop program available on the ,uLab will run. Try running this
            program by sliding the ,uLab's SA slide switch up and then down. If all the display segments
            and output LEOs had lighted and the speaker had beeped, then the SA loop would have
            been engaged. But not a flicker or a sound was generated. Read on to see what this means.
      CHECKPOINT 1

      Problems:

        • The whole system does not run.

         • The display does not do anything useful, nor does it appear to respond to the keys.

        • The SA test program will not run, even though it requires even fewer system circuits to work.

      On the bright side:

        • Because there is some bus activity, you know that the microprocessor is running (to some extent).


                                                                                                           Lesson 19
320                                                                                        Practical Microprocessors


## Page 347




_ _ _ _ _ _ _ _ _ EXPERIMENT 19-1
                                                                                            (Continued)


      • The power supply appears to be good. A quick check of its actual voltage would confirm this.
   Conclusion: The problem appears to be somewhere between the microprocessor and something
   connected to the bus. Unfortunately, this still involves most of the circuitry.

   III. Partitioning the System

       A) Start by isolating the microprocessor. Open the data bus. It is the only major feedback path in
          the system. To open the bus, slide the eight bus switches in the DIP package, located just below
          the microprocessor (labeled BUS SWITCH), to the "up" (FREE-RUN) position. This dis-
          connects the microprocessor from all of the other devices on the data bus and allows it to
          run "open-loop."

       B) Now that the data bus is open, the microprocessor should be put into a free-running mode,
          which allows it to cycle continuously through the full address field. Slide the switch marked FR
          (next to the SA switch) up to hardwire in an instruction to the microprocessor that forces
          free-running to occur.

       C) Probe several of the data lines and observe the viSibly flashing high-order address line LEOs to
          verify free-run activity. This bus activity should be no surprise since even less of the system is
          being exercised than before.

   CHECKPOINT 2
   What have you done?

      • Given up trying to get the system to run a program.

      • Isolated the microprocessor kernel from most of the rest of the system and allowed it to run in a
        free-running open-loop mode.

   Now what can you do?
      • You can examine the microprocessor by itself.

      • You can see it cycle through the address field.

      • You can evaluate what effect the address bus has on the ROM, the address decoder, and other
        circuits.

      • You can look at the data bus without regard for its effect on the microprocessor, since the
        processor no longer has any instruction or data path going back to it (feedback).

   What tools are needed to accomplish the above? Remember, you need to analyze long, complex
   data streams that are present on the logic nodes of these devices. This free-run cycle is 2 16 , or
   65,536 cycles, long!


Lesson 19
Practical Microprocessors                                                                                      321
EXPERIMENT 19-1 _ _ _ _ _ _ _ __


## Page 348


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


( Continued)


      IV. Examining the Logic Nodes

         A) The signature analyzer discussed in Lesson 17 is one such tool. By compressing a long,
            complex serial data stream into a four-digit "signature," the signature analyzer makes it easy to
            tell a good node from a bad one.

         B) Connect the signature analyzer as shown in Figure 19-3 and turn it on. Set its front panel
            switches as shown.

         C) The signature analyzers' probe can be used as a logic probe by observing the lamp in its tip.
            Touch the probe to the ground (      &) slot. Observe that the display reads 0000, as it always
            should when the probe is connected to ground . Now touch the probe to Vcc. The signature on
            the display should read 0001. If it doesn't, check the set-up and the switch positions on the
            f..LLab (OAT A BUS and FR switches up ) and the signature analyzer. Press (~) if there appears to
            be no bus activity.

                            SET-UP
                      Line Switch In (Down \
                      All Others Out (Up
                      GND to  .&
                      STA RT to A15
                      STOP to A1 5
                      CLOCK to READ


                   Figure 19-3.    Signature Analysis Set-Up for Free-Run Address Test Mode

      CHECKPOINT 3

  What does this signature tell us?

        • The signature analyzer is properly set-up and connected .

        • The microprocessor is free-running correctly in an open-loop mode because the data bus is no
          longer connected to it. The kernel is running .

        • We can now use the signature analyzer to check signatures on logic nodes stimulated by the
          free-running microprocessor.


                                                                                                    Lesson 19


## Page 349




_ _ _ _ _ _ _ _ _ EXPERIMENT 19-1
                                                                                              (Continued)


   V. Taking Signatures

       A) Consult Table C-1 and take signatures on all of the address lines using the probe holes
          provided. They should all agree with those in the table.

       B) It appears that the A11 address line is faulty because it produces the same Signature as A10.
          What does this mean? Could they be shorted together?

       C) If you have not yet opened up the J.lLab's schematic, do so now. Notice that the schematic is
          laid out similarly to the J.lLab's circuit board. Now locate the points connected to A10 and A11
          on the schematic.

       D) Observe that A10 and A11 are not connected directly to the microprocessor but go through
          buffer Ul A short between A10 and A11 on either side of buffer U1 could be causing the bad
          signature.

       E) Now check the signatures on U1 pins 4 and 2 (the inputs to the A10 and A11 buffers) against
          their proper values from Table C-l They are correct.

       F) Check signatures on U1 pins 5 and 3 (the outputs of the buffer) to see if U1 is at fault. They are
          also correct. The fault must be between the U1 outputs (pins 5 and 3) and the address bus test
          points A10 and A11.

       G) Follow the trace with the signature analyzer probe going from U1-3 toward the A11 test point.
          This should lead you to fault jumper Wl For the time being, leave this fault set.

       H) The fault has been found and no additional Signatures need to be taken. However, to satisfy
          your own curiosity, look at the signatures on other nodes specified in Table C-1 and see which
          ones are affected by the A11 fault.

   Before restoring fault jumper W1 to its proper position, you can take advantage of the A10 to A11 bus
   line short to demonstrate the use of the current tracer with the logic pulser.


   VI. Current Tracing

       A) Connect the power leads of the current tracer and the logic pulser to the power slots on the
          J.lLab board.

       B) Press the logic pulser switch down and slide it forward. The tip should be flashing rapidly
          indicating that it is in the 100 Hz mode. If it is not, slide the switch back, release and repeat. The
          pulser is now set to inject a pulSing current into a node.


Lesson 19
Practical Microprocessors                                                                                      323
EXPERIMENT 19-1 _ _ _ _ _ _ _ __


## Page 350


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


( Continued)


      C) Touch the pulser tip to the A11 line at the location shown in Figure 19-4. The pulser is now
         injecting current pulses into this address line.


                           Figure 19-4.    Pulsing Current into A 11 Address Line

      D) With the pulser still on the A11 node, place the tip of the current tracer at right angles to and
         touching the tip of the pulser (see Figure 19-5). Make sure that the adjustment knob on the


                           ..
         current tracer is in line with (parallel to) the pulser tip. Now adjust the knob on the current
         tracer to cause its lamp to glow dimly.


                            Figure 19-5.    Adjusting Current Tracer Sensitivity


                                                                                                    Lesson 19


## Page 351


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



_ _ _ _ _ _ _ _ _ EXPERIMENT 19-1
                                                                                            ( Continued)


        E) The current tracer is now adjusted to detect the current injected into the node by the pu lser.
           Follow the current from the pulser tip onto the A11 line by moving the current tracer. Determine
           in which direction the current goes (left or right of the pulser tip) once the tracer contacts the
           circuit board . Remember that the brighter the lamp, the stronger the current. Be sure to keep
           the two holes on the side of the tip in line with the A11 circuit trace and the tip at right angles
           to the board .

        F) Hopefu lly you chose to go toward the left and found that the lamp mysteriously dimmed
           once you came to the point shown in Figure 19-6. As you know, current never disappears into
           thin air nor does it fall through a hole in the board. It must therefore be flowing through the
           plated-through hole to the other side of the board .


                                Figure 19-6.   Point at Which Current Changes

       G) Check this by lifting the board and continuing to trace the current on the rear side. A firm tug
          on the black knob located near the center of the right edge of the pLab PC board will release
          the board and allow it to swing up. If you allow the board to swing past the vertical position, it
          will hold itself up.

       H) The current tracer should lead you through fault jumper W1 to the A10 line. You have now found
          the problem.

        I) Restore fault jumper W1 to its original position (left two holes). You may wish to verify the sig-
           natures on the A 10 and A 11 lines.

        J) Slide the free-run (FR) switch down to its normal mode and do the same for the data bus
           switches.


Lesson 19
Practical Microprocessors                                                                                    325
EXPERIMENT 19-1 _ _ _ _ _ _ _ __


## Page 352



(Continued)


          K) Press   (:n) once or twice and observe the display message u L R b           UP.
           L) Turn the power off and then on to verify that the power-on self-test operates properly and
              produces the same message.


      SUMMARY

      In this experiment a fault was inserted by means of a jumper. Visual observations of the /.LLab indicators,
      internal self-test features, and the logic probe were used to eliminate some of the possible fault sources.
      Since no program would run, the major feedback path (the data bus) was opened. The microprocessor
      was then set to the free-run mode, isolating the microprocessor from the rest of the system and
      preventing the components from interacting with each other. The signature analyzer was used to
      identify good and bad logic nodes in the free-run test loop. Once the faulty lines were found and the
      nature of the fault determined (A 10 and A11 shorted together), the signature analyzer led you to the
      actual fault. Even though the fault had been found, the current tracer and the logic pulser were used
      to illustrate how they could also have led you to it. The pulser injected current pulses into one of the
      nodes while the current tracer followed that current to the other node. The path joining these two
      nodes was the fault. On a typical product, this type of fault is often caused by a solder short or
      gold bridge and can sometimes be very difficult to find visually or by means of voltage tracing
      techniques.


                                                                                                       Lesson 19


## Page 353


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.



A conventional oscilloscope can also be used to locate this type of fault. The pro-       TROUBLESHOOTING
cedure is similar to that used with the signature analyzer. The fundamental differ-       WITH AN
ence is in the interpretation of the measurements.                                        OSCILLOSCOPE

In tracing the faul t in this experiment , the oscilloscope can be used to verify the
general presen ce of activity on the address, data, and control buses and the
device chip enable pins. In the process of doing so, you could also detect
identical waveforms on the A10 and A11 bus lines. However, unless these lines
were already suspect, it is unlikely that this coincidence would be noticed .


If the system is made to free-run , the oscilloscope can display each of the sixteen
address bus lines in turn . Since th e frequency of these incrementing address lines
should be either double or half that of an adjacent address line, the A10 to A11
short would be obvious on the scope display (see Figure 19-7 ).


      A9   0V                                                                   5V/ div


     A10 0V                                                                     5V/ div


     A11   0V                                                -        -,....-   5V/ div


    A12    0V                                       -            --   '::lo     5V/ div


                  Figure 19-7. Scope Display of A10 to A11 Short

Whereas the signature analyzer presents precise go/ no-go information, the
oscilloscope's waveform must be analyzed against expected results . It is very
difficult to evaluate the long , complex bit streams that are present in
microprocessor- based systems on an oscilloscope. Drive, timing , and gross
funct ional failures (e.g., stuck nodes ), can however, be easily observed .


The next step is to find faults on your own . All twelve fault locations have three       TROUBLESHOOTING
socket pins with a jumper plug connecting the middle pin to one of the end ones           THE FAULTS
(see Figure 19-8) . One jumper position is normal , and the other introduces a cir-
cuit fault. The jumpers do not appear on the schematic. Jumpers should always
be installed in one of the two hole pairs. A small dot appears on the underside
of the circuit board beneath the normal (fault-free) jumper position . Use these
dots as a "last resort" means for restoring the ~Lab to its normal operating mode.


These fault jumpers simulate such real-world circuit malfunctions as shorted and
open traces, stuck and open outputs, and functional failures within the ICs. In
some cases, a fault jumper actually causes more than one change to occur. For
example, some faults open one trace and short it to another to prevent potentially


Lesson 19
Practical Microprocessors                                                                            327
      destructive component overloads from occurring . While faults that do so are not


## Page 354


> [!note]
> This page contains structured educational or figure-referenced content. Use the page image when exact labels, code, or tabular alignment matters.


      as real istic as th e others, they are just as instructive for learning how to
      troubleshoot.
      You can either introduce a fault jumper yourself or have someone else do it for you
      (so that you won 't know which one it is ). For those who wish to increase the chal-
      lenge, multi ple faults can be set. It is helpful to refer to the board trace diagram of
      the MLab at the back of the book so that circuit traces, covered by components, can
      be followed during the course of troubleshooting .


      Figure 19-8.   All Twelve Fault Jump ers H ave Tw o Po sition s: Norm al and Fault y. A dot
                     on the rear of th e board indicates the normal ( fault-fre e) position.


      As with real circuit failures, some faults are easier to troubleshoot than others.
      If you have difficulty with a particular fault, you may wish to skip it and return to it
      after you have found others and gained more confidence in your technique. Do
      not be afraid to check the solutions if you are really stumped . You can learn more
      from the solutions than from floundering around pointlessly. The solutions can
      show you where you may have taken a wrong turn , made an incorrect observa-
      tion, or missed taking a measurement. After you have successfully found a fault,
      you may wish to compare your solution with the one documented in Appendix A.

      There are two types of fault solution descriptions:
         • The simplified path taken on the Microprocessor Lab Troubleshooting Dia-
           gram .
         • A more detailed description of the troubleshooting process, using the
           Microprocessor Lab Troubleshooting Diagram.

      Both sol utions make use of signature analysis.


                                                                                 Lesson 19


## Page 355




There are some relevant differences in the nature of the faults on the j..(Lab and
those that might occur in other microprocessor products. None of j..(Lab faults are
marginal, are caused by bad components, connectors, or power supply, or are
hard to spot visually. All possible faults are located on a single PC board.
The j..(Lab contains a relatively small number of devices and no analog circuits
whatsoever.

Keep in mind that the j..(Lab is a teaching tool. A number of the features designed
into it for this purpose are not present in most microprocessor-based products.
The liberal use of LEDs to indicate bus and control functions on the j..(Lab cannot
be expected on other products. In addition, the ability to manually enter and step
through programs is very uncommon in dedicated applications. The easy-to-
follow placement of devices and bus lines and the liberal use of graphics on the
PC board of the j..(Lab is not consistent with the economic and packaging con-
straints of larger, noneducational products.

In the j..(Lab, the microprocessor is the essence of the product. In most other
applications, the peripherals define the products' identity; the microprocessor
acts merely as the controller.


Lesson 19
Practical Microprocessors                                                             329
RE\!1EW _ _ _ _ _ _ _ _ _ _ __


## Page 356



Lesson 19


            This lesson related entirely to troubleshooting the /-lLab. Its troubleshooting tree
            was discussed, and you were directed through an actual fault solution. The fault
            jumpers were described, and you were given the opportunity to troubleshoot
            faults on your own.


                                                                                   Lesson 19
330                                                                Practical Microprocessors


## Page 357




-------~----------------------
                                                                                       _QUIZ
                                                                                        Lesson 19


1. If the free-run test loop will not run:
   a. the SA loop will not run either.
   b. a microprocessor control line may be stuck.
   c. the microprocessor may be faulty.
   d. all of the above may be true.

2. The main advantage of the SA test loop over the free-run test mode is that it:
   a. is easier to run.
   b. requires less of the circuitry to run.
   c. takes signatures faster.
   d. exercises more of the circuitry.

3. If the J.lLab successfully passes the power-up self-test, it can be assumed that:
   a. the entire board is fault-free.
   b. the address and data buses are fault-free.
   c. the kernel and the keyboard are fault-free.
   d. the keyboard and the display are fault-free.

4. The primary purpose of opening the data bus lines between the microprocessor
   and the rest of the system is:
   a. to reduce bus loading on the microprocessor outputs.
   b. to prevent the microprocessor from being sent instructions from the rest
      of the system.
   c. to prevent the microprocessor from sending data to the rest of the system.
   d. to do all of the above.

5. Two lines that have the same incorrect signature on them may be:
  a. inputs and outputs of a buffer IC.
  b. shorted to ground.
  c. shorted together.
  d. all of the above.


Lesson 19
Practical Microprocessors                                                                      331
    THIS


## Page 358



    PAGE
    LEFT
   BLANK

    By




## Page 359




                                                                                                 VI
_OTHER MICROPROCESSORS


                            The Microprocessor Lab uses Intel's 8085 microprocessor. This lesson describes
                            some other widely used microprocessors. While the details may vary greatly from
                            one microprocessor to another, the basic concepts remain the same. Learning
                            about another microprocessor will be relatively easy now that you understand
                            these concepts.


Lesson 20
Practical Microprocessors                                                                              333
    THIS


## Page 360



    PAGE
    LEFT
   BLANK

    By




## Page 361




