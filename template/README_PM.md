ESS MTCA Power Module (PM)
=======

## Type 1 : PM-AC1000 (Wiener AC1000)
* http://www.wiener-d.com/sc/power-supplies/mtca-ps/mtca-4.0.html
* http://file.wiener-d.com/documentation/MTCA.4/MTCA4_V14.pdf

```
nat> show_sensorinfo 51
Sensor Information for FRU 51 / PM2
==================================================================
  #   SDRType  Sensor Entity Inst  Value   State    Name
------------------------------------------------------------------
  -   MDevLoc          0x0a  0x62                    PM-AC1000
  1   Full     Temp    0x0a  0x62  36 C       ok     T DCDC UPD
  2   Full     Temp    0x0a  0x62  34 C       ok     T PATH UPD
  3   Full     Temp    0x0a  0x62  41 C       ok     T COOLER UPM
  4   Full     Temp    0x0a  0x62  37 C       ok     T TRAFO UPM
  5   Full     Voltage 0x0a  0x62  3.24 V     ok     MP
  6   Full     Voltage 0x0a  0x62  4.98 V     ok     SMP
  7   Full     Voltage 0x0a  0x62  4.98 V     ok     SMPP
  8   Full     Voltage 0x0a  0x62  12.36 V    ok     PP
  9   Full     Voltage 0x0a  0x62  11.40 V    ok     12VHH
 10   Full     Current 0x0a  0x62  10.40 A    ok     Current(Sum)
 11   Full     Current 0x0a  0x62  1.45 A     ok     Ch01 Current
 12   Full     Current 0x0a  0x62  0.00 A     ok     Ch02 Current
 13   Full     Current 0x0a  0x62  1.75 A     ok     Ch03 Current
 14   Full     Current 0x0a  0x62  1.90 A     ok     Ch04 Current
 15   Full     Current 0x0a  0x62  1.80 A     ok     Ch05 Current
 16   Full     Current 0x0a  0x62  0.55 A     ok     Ch06 Current
 17   Full     Current 0x0a  0x62  0.00 A     ok     Ch07 Current
 18   Full     Current 0x0a  0x62  1.95 A     ok     Ch08 Current
 19   Full     Current 0x0a  0x62  0.00 A     ok     Ch09 Current
 20   Full     Current 0x0a  0x62  0.00 A     ok     Ch10 Current
 21   Full     Current 0x0a  0x62  0.00 A     ok     Ch11 Current
 22   Full     Current 0x0a  0x62  1.25 A     ok     Ch12 Current
 23   Full     Current 0x0a  0x62  0.00 A     ok     Ch13 Current
 24   Full     Current 0x0a  0x62  0.00 A     ok     Ch14 Current
 25   Full     Current 0x0a  0x62  0.00 A     ok     Ch15 Current
 26   Full     Current 0x0a  0x62  0.00 A     ok     Ch16 Current
 27   Compact  0xf2    0x0a  0x62  0x01              HotSwap
 28   Event       -    0x0a  0x00                    PwrChan
 29   Event       -    0x0a  0x00                    PM_Stat
 28   Compact  0xf0    0x0a  0x62  0x10              HS 051 PM2
------------------------------------------------------------------
```

* pm_type1_ess.substitutions


## Type 2 : NAT-PM-AC600D
* https://www.nateurope.com/products/NAT-PM-AC600D.html
* https://www.nateurope.com/data_sheets/nat_pm_ac600d_ds.pdf

```
nat> show_sensorinfo 50
Sensor Information for FRU 50 / PM1
==================================================================
  #   SDRType  Sensor Entity Inst  Value   State    Name
------------------------------------------------------------------
  -   MDevLoc          0x0a  0x61                    NAT-PM-AC600D
  1   Full     Temp    0x0a  0x61  32 C       ok     T_CPU
  2   Full     Temp    0x0a  0x61  44 C       ok     T_XFrm
  4   Full     Temp    0x0a  0x61  47 C       ok     T-PSB
  5   Full     Temp    0x0a  0x61  46 C       ok     T-PFC
  6   Full     Temp    0x0a  0x61  44 C       ok     T-REC
  7   Full     Voltage 0x0a  0x61  238 V      ok     VINAC
  8   Full     Voltage 0x0a  0x61  384 V      ok     VINDC
  9   Full     Voltage 0x0a  0x61  12.4 V     ok     12V
 10   Full     Voltage 0x0a  0x61  3.4 V      ok     3.3V
 11   Full     Current 0x0a  0x61  7.00 A     ok     I_Sum
 12   Compact  Current 0x0a  0x61  1.55 A     ok     I_CH01
 13   Compact  Current 0x0a  0x61  0.00 A     ok     I_CH02
 14   Compact  Current 0x0a  0x61  2.55 A     ok     I_CH03
 15   Compact  Current 0x0a  0x61  0.00 A     ok     I_CH04
 16   Compact  Current 0x0a  0x61  0.00 A     ok     I_CH05
 17   Compact  Current 0x0a  0x61  1.85 A     ok     I_CH06
 18   Compact  Current 0x0a  0x61  0.00 A     ok     I_CH07
 19   Compact  Current 0x0a  0x61  0.60 A     ok     I_CH08
 20   Compact  Current 0x0a  0x61  0.00 A     ok     I_CH09
 21   Compact  Current 0x0a  0x61  0.70 A     ok     I_CH10
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

* pm_type2_ess.substitutions

