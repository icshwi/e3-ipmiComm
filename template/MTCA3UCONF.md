
# MTCA 3U Crate

## HW Configuration

```console
nat> show_fru
FRU Information:
----------------
 FRU  Device   State  Name
==========================================
  0   MCH       M4    NMCH-CM
  3   mcmc1     M4    NAT-MCH-MCMC
  6   AMC2      M4    CCT AM 900/412
  7   AMC3      M4    mTCA-EVR-300 
  8   AMC4      M4    mTCA-EVR-300 
  9   AMC5      M4    mTCA-EVR-300 
 10   AMC6      M4    mTCA-EVR-300 
 40   CU1       M4    Schroff uTCA CU
 50   PM1       M4    NAT-PM-AC600D
 60   Clock1    M4    MCH-Clock
 61   HubMod1   M4    MCH-PCIe
==========================================
```

```console
nat> show_sensorinfo 3
Sensor Information for FRU 3 / MCMC1
==================================================================
  #   SDRType  Sensor Entity Inst  Value   State    Name
------------------------------------------------------------------
  -   MDevLoc          0xc2  0x61                    NAT-MCH-MCMC
  1   Full     Temp    0xc2  0x61  43 C       ok     Temp CPU
  2   Full     Temp    0xc2  0x61  37 C       ok     Temp I/O
  3   Compact  0xf2    0xc2  0x61  0x01              HotSwap
  4   Compact  0x2b    0xc2  0x61  0x00              Version Change
  5   Full     Voltage 0xc2  0x61  1.19 V     ok     Base 1.2V
  6   Full     Voltage 0xc2  0x61  1.50 V     ok     Base 1.5V
  7   Full     Voltage 0xc2  0x61  1.81 V     ok     Base 1.8V
  8   Full     Voltage 0xc2  0x61  2.43 V     ok     Base 2.5V
  9   Full     Voltage 0xc2  0x61  3.360 V    ok     Base 3.3V
 10   Full     Voltage 0xc2  0x61  12.12 V    ok     Base 12V
 11   Full     Current 0xc2  0x61  1.58 A     ok     Base Current
 12   Compact  0xf0    0xc2  0x61  0x10              HS 003 MCMC1
------------------------------------------------------------------
```

```console
nat> R(61,17,1)show_sensorinfo 6
Sensor Information for FRU 6 / AMC2
==================================================================
  #   SDRType  Sensor Entity Inst  Value   State    Name
------------------------------------------------------------------
  -   MDevLoc          0xc1  0x62                    CCT AM 900/412
    - unknown SDR=0x13
    - unknown SDR=0x13  2   Full     Temp    0xc1  0x62  41 C       ok     CPU INT Temp
  3   Full     Temp    0xc1  0x62  43 C       ok     CPU AMB Temp
  4   Full     Temp    0xc1  0x62  41 C       ok     Ambient Temp
  5   Full     Voltage 0xc1  0x62  12.354 V   ok     +12V PSU
  6   Full     Voltage 0xc1  0x62  5.115 V    ok     +5V PSU
  7   Full     Voltage 0xc1  0x62  3.230 V    ok     +3.3V PSU
  8   Full     Voltage 0xc1  0x62  1.080 V    ok     +PS 1V05
  9   Full     Voltage 0xc1  0x62  1.020 V    ok     +PS 1V0
 10   Full     Voltage 0xc1  0x62  0.650 V    ok     VCC CORE
 11   Compact  0xf2    0xc1  0x62  0x01              Ejector Handle
 12   Compact  0xf0    0xc1  0x62  0x10              HS 006 AMC2
------------------------------------------------------------------
```

```console
nat> show_sensorinfo 7
Sensor Information for FRU 7 / AMC3
==================================================================
  #   SDRType  Sensor Entity Inst  Value   State    Name
------------------------------------------------------------------
  -   MDevLoc          0xc1  0x63                    mTCA-EVR-300 
  0   Full     0xf2    0xc1  0x63  0x01              Hot Swap
  1   Full     Voltage 0xc1  0x63  2.368 V    ok     REF
  2   Full     Voltage 0xc1  0x63  24.9 V     ok     Temp 1
  3   Full     Voltage 0xc1  0x63  14.4 V     ok     Temp 2
  4   Full     Voltage 0xc1  0x63  0.992 V    ok     1.0 V
  5   Full     Voltage 0xc1  0x63  1.776 V    ok     1.8 V
  6   Full     Voltage 0xc1  0x63  12.3 V     ok     12 V
  7   Full     Voltage 0xc1  0x63  3.296 V    ok     3.3 V
  8   Full     Voltage 0xc1  0x63  3.312 V    ok     3.3 V MP
  9   Compact  0x0b    0xc1  0x63  0x00              0x00  FPGA Done
 10   Full     Temp    0xc1  0x63  42.5 C     ok     Local
 11   Full     Temp    0xc1  0x63  57.5 C     ok     FPGA
 12   Compact  0xf0    0xc1  0x63  0x10              HS 007 AMC3
------------------------------------------------------------------
```

```console
nat> show_sensorinfo 8
Sensor Information for FRU 8 / AMC4
==================================================================
  #   SDRType  Sensor Entity Inst  Value   State    Name
------------------------------------------------------------------
  -   MDevLoc          0xc1  0x64                    mTCA-EVR-300 
  0   Full     0xf2    0xc1  0x64  0x01              Hot Swap
  1   Full     Voltage 0xc1  0x64  2.368 V    ok     REF
  2   Full     Voltage 0xc1  0x64  22.4 V     ok     Temp 1
  3   Full     Voltage 0xc1  0x64  13.4 V     ok     Temp 2
  4   Full     Voltage 0xc1  0x64  0.992 V    ok     1.0 V
  5   Full     Voltage 0xc1  0x64  1.776 V    ok     1.8 V
  6   Full     Voltage 0xc1  0x64  12.2 V     ok     12 V
  7   Full     Voltage 0xc1  0x64  3.296 V    ok     3.3 V
  8   Full     Voltage 0xc1  0x64  3.312 V    ok     3.3 V MP
  9   Compact  0x0b    0xc1  0x64  0x00              0x00  FPGA Done
 10   Full     Temp    0xc1  0x64  42.5 C     ok     Local
 11   Full     Temp    0xc1  0x64  55.5 C     ok     FPGA
 12   Compact  0xf0    0xc1  0x64  0x10              HS 008 AMC4
```

```console
nat> show_sensorinfo 9
Sensor Information for FRU 9 / AMC5
==================================================================
  #   SDRType  Sensor Entity Inst  Value   State    Name
------------------------------------------------------------------
  -   MDevLoc          0xc1  0x65                    mTCA-EVR-300 
  0   Full     0xf2    0xc1  0x65  0x01              Hot Swap
  1   Full     Voltage 0xc1  0x65  2.368 V    ok     REF
  2   Full     Voltage 0xc1  0x65  15.4 V     ok     Temp 1
  3   Full     Voltage 0xc1  0x65  6.9 V      ok     Temp 2
  4   Full     Voltage 0xc1  0x65  0.992 V    ok     1.0 V
  5   Full     Voltage 0xc1  0x65  1.776 V    ok     1.8 V
  6   Full     Voltage 0xc1  0x65  12.4 V     ok     12 V
  7   Full     Voltage 0xc1  0x65  3.296 V    ok     3.3 V
  8   Full     Voltage 0xc1  0x65  3.312 V    ok     3.3 V MP
  9   Compact  0x0b    0xc1  0x65  0x00              0x00  FPGA Done
 10   Full     Temp    0xc1  0x65  38.5 C     ok     Local
 11   Full     Temp    0xc1  0x65  50.5 C     ok     FPGA
 12   Compact  0xf0    0xc1  0x65  0x10              HS 009 AMC5
------------------------------------------------------------------
```

```console
nat> show_sensorinfo 10
Sensor Information for FRU 10 / AMC6
==================================================================
  #   SDRType  Sensor Entity Inst  Value   State    Name
------------------------------------------------------------------
  -   MDevLoc          0xc1  0x66                    mTCA-EVR-300 
  0   Full     0xf2    0xc1  0x66  0x01              Hot Swap
  1   Full     Voltage 0xc1  0x66  2.368 V    ok     REF
  2   Full     Voltage 0xc1  0x66  13.3 V     ok     Temp 1
  3   Full     Voltage 0xc1  0x66  6.9 V      ok     Temp 2
  4   Full     Voltage 0xc1  0x66  0.992 V    ok     1.0 V
  5   Full     Voltage 0xc1  0x66  1.776 V    ok     1.8 V
  6   Full     Voltage 0xc1  0x66  12.4 V     ok     12 V
  7   Full     Voltage 0xc1  0x66  3.312 V    ok     3.3 V
  8   Full     Voltage 0xc1  0x66  3.328 V    ok     3.3 V MP
  9   Compact  0x0b    0xc1  0x66  0x00              0x00  FPGA Done
 10   Full     Temp    0xc1  0x66  38.5 C     ok     Local
 11   Full     Temp    0xc1  0x66  50.5 C     ok     FPGA
 12   Compact  0xf0    0xc1  0x66  0x10              HS 010 AMC6
------------------------------------------------------------------
```

```console
nat> show_sensorinfo 40
Sensor Information for FRU 40 / CU1
==================================================================
  #   SDRType  Sensor Entity Inst  Value   State    Name
------------------------------------------------------------------
  -   MDevLoc          0x1e  0x61                    Schroff uTCA CU
  0   Full     0xf2    0x1e  0x61  0x01              Hot Swap
  1   Full     0xf1    0x1e  0x61  0x88 0xc0 0x08   IPMB Physical
  2   Full     Voltage 0x1e  0x61  3.2858 V   ok     +3.3V
  3   Full     Voltage 0x1e  0x61  12.593 V   ok     +12V
  4   Full     Voltage 0x1e  0x61  12.648 V   ok     +12V_1
  5   Full     Temp    0x1e  0x61  34.00 C    ok     LM75 Temp
  6   Full     Temp    0x1e  0x61  34.00 C    ok     LM75 Temp2
  7   Full     Fan     0x1e  0x61  9720 RPM   ok     Fan 1
  8   Full     Fan     0x1e  0x61  7680 RPM   ok     Fan 2
  9   Full     Fan     0x1e  0x61  9720 RPM   ok     Fan 3
 10   Full     Fan     0x1e  0x61  7680 RPM   ok     Fan 4
 11   Full     0xc0    0x1e  0x61  0x00                  0x02  Air Filter
 12   Compact  0xf0    0x1e  0x61  0x10              HS 040 CU1
------------------------------------------------------------------
```

```console
nat> show_sensorinfo 50
Sensor Information for FRU 50 / PM1
==================================================================
  #   SDRType  Sensor Entity Inst  Value   State    Name
------------------------------------------------------------------
  -   MDevLoc          0x0a  0x61                    NAT-PM-AC600D
  1   Full     Temp    0x0a  0x61  44 C       ok     T_CPU
  2   Full     Temp    0x0a  0x61  44 C       ok     T_XFrm1
  3   Full     Temp    0x0a  0x61  33 C       ok     T_XFrm2
  4   Full     Temp    0x0a  0x61  47 C       ok     T-PSB
  5   Full     Temp    0x0a  0x61  46 C       ok     T-PFC1
  6   Full     Temp    0x0a  0x61  45 C       ok     T-REC
  7   Full     Voltage 0x0a  0x61  244 V      ok     VINAC
  8   Full     Voltage 0x0a  0x61  396 V      ok     VINDC
  9   Full     Voltage 0x0a  0x61  12.4 V     ok     12V
 10   Full     Voltage 0x0a  0x61  3.4 V      ok     3.3V
 11   Full     Current 0x0a  0x61  9.00 A     ok     I_Sum
 12   Compact  Current 0x0a  0x61  1.45 A     ok     I_CH01
 13   Compact  Current 0x0a  0x61  0.00 A     ok     I_CH02
 14   Compact  Current 0x0a  0x61  1.65 A     ok     I_CH03
 15   Compact  Current 0x0a  0x61  0.00 A     ok     I_CH04
 16   Compact  Current 0x0a  0x61  0.00 A     ok     I_CH05
 17   Compact  Current 0x0a  0x61  1.75 A     ok     I_CH06
 18   Compact  Current 0x0a  0x61  1.65 A     ok     I_CH07
 19   Compact  Current 0x0a  0x61  1.65 A     ok     I_CH08
 20   Compact  Current 0x0a  0x61  0.75 A     ok     I_CH09
 21   Compact  Current 0x0a  0x61  0.55 A     ok     I_CH10
 22   Compact  Current 0x0a  0x61  0.00 A     ok     I_CH11
 23   Compact  Current 0x0a  0x61  0.00 A     ok     I_CH12
 24   Compact  Current 0x0a  0x61  0.00 A     ok     I_CH13
 25   Compact  Current 0x0a  0x61  0.00 A     ok     I_CH14
 26   Compact  Current 0x0a  0x61  0.00 A     ok     I_CH15
 27   Compact  Current 0x0a  0x61  0.00 A     ok     I_CH16
 28   Compact  0xf2    0x0a  0x61  0x01              HotSwap
 29   Event       -    0x0a  0x00                    PwrChan
 30   Event       -    0x0a  0x00                    PM_Stat
 29   Compact  0xf0    0x0a  0x61  0x10              HS 050 PM1
------------------------------------------------------------------
```

```console
nat> show_sensorinfo 60
Sensor Information for FRU 60 / CLK1
==================================================================
  #   SDRType  Sensor Entity Inst  Value   State    Name
------------------------------------------------------------------
  -   MDevLoc          0xc2  0x63                    MCH-Clock
  1   Full     Temp    0xc2  0x63  37 C       ok     Temp DC/DC
  2   Full     Temp    0xc2  0x63  47 C       ok     Temp DC/DC max
  3   Full     Temp    0xc2  0x63  46 C       ok     Temp Mux
  4   Full     Temp    0xc2  0x63  62 C       ok     Temp Mux max
  5   Full     Voltage 0xc2  0x63  3.408 V    ok     3.3V
  6   Full     Voltage 0xc2  0x63  12.42 V    ok     12V
------------------------------------------------------------------
```

```console
nat> show_sensorinfo 61
Sensor Information for FRU 61 / HUB1
==================================================================
  #   SDRType  Sensor Entity Inst  Value   State    Name
------------------------------------------------------------------
  -   MDevLoc          0xc2  0x64                    MCH-PCIe
  1   Full     Temp    0xc2  0x64  38 C       ok     Temp DC/DC
  2   Full     Temp    0xc2  0x64  51 C       ok     Temp DC/DC max
  3   Full     Temp    0xc2  0x64  59 C       ok     Temp Switch
  4   Full     Temp    0xc2  0x64  77 C       ok     Temp Switch max
  5   Full     Temp    0xc2  0x64  37 C       ok     Temp PCB
  6   Full     Temp    0xc2  0x64  30 C       ok     Temp PCB max
  7   Full     Voltage 0xc2  0x64  0.90 V     ok     0.9V
  8   Full     Voltage 0xc2  0x64  0.89 V     ok     0.9V analog
  9   Full     Voltage 0xc2  0x64  1.79 V     ok     1.8V
 10   Full     Voltage 0xc2  0x64  3.360 V    ok     3.3V
 11   Full     Voltage 0xc2  0x64  12.18 V    ok     12V
------------------------------------------------------------------
```
