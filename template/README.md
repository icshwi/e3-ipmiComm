# ESS Customized DB and Template files

SLAC has db, substitutions, substitutions, and they are inflating into db files all. However, ESS has template, substitutions, substitutions, and only substitutions are inflating into db files. 

## dev

Due to the ESS naming convention, we touch db template files. So, `dev` can be expanded into `A-B:C-D:IPMI_NAME`. 

##  db template files

No alias version of the SLAC original ones

- [x] `fru_common_ess.template`
- [x] `sensor_ai_ess.template`
- [x] `fru_cu_common_ess.template`
- [x] `system_powerstate_unsupported_ess.template`
- [x] `system_common_ess.template`
- [x] `system_chassis_status_ess.template`

## Files that make up our high-level templates

- [x] `fru_basic_ess.substitutions`    (fru_common_ess.template, sensor_ai_ess.template)
- [x] `fru_extended_ess.substitutions` (fru_common_ess.template, sensor_ai_ess.template)
- [x] `fru_pm_ess.substitutions`       (fru_common_ess.template, sensor_ai_ess.template)
- [x] `fru_cu_ess.substitutions`       (fru_cu_common_ess.template, fru_common_ess.template, sensor_ai_ess.template)
- [x] `sensor_mch_ess.substitutions`   (sensor_ai_ess.template)
- [x] `sensor_clock_ess.substitutions` (sensor_ai_ess.template)
- [x] `sensor_hub_ess.substitutions`   (sensor_ai_ess.template)

## substitutions files to be loaded per device 

Note that **-ess.substitutions** instead of **_ess.substitutions**.

- [x] `mtca9u-ess.substitutions`
  - system_common_ess.template
  - system_powerstate_unsupported_ess.template
  - fru_common_ess.template
  - fru_basic_ess.db
  - fru_cu_ess.db
  - fru_pm_ess.db
  - sensor_mch_ess.db
  - sensor_clock_ess.db
  - sensor_hub_ess.db
  
- [x] `mtca3u-ess.substitutions`
  - system_common_ess.template
  - system_powerstate_unsupported_ess.template
  - fru_basic_ess.db
  - fru_cu_ess.db
  - fru_pn_ess.db

# Identify correct sensor info

```console
nat> show_fru

FRU Information:
----------------
 FRU  Device   State  Name
==========================================
  0   MCH       M4    NMCH-CM
  3   mcmc1     M4    NAT-MCH-MCMC
  5   AMC1      M4    CCT AM 900/412
 13   AMC9      M1    SIS8300KU AMC
 40   CU1       M4    Schroff uTCA CU
 41   CU2       M4    Schroff uTCA CU
 51   PM2       M4    PM-AC1000
 60   Clock1    M4    MCH-Clock
 61   HubMod1   M4    MCH-PCIe
==========================================
```
## fru_cu_ess.substitutions

```console
nat> show_cu
System has 2 Cooling Unit(s)
-----------------------------------------------
Site   FRU   i2c    MIN  NORM  MAX   Level
 CU1F  40    0xa8   0    2     15    4(26%)
 CU2F  41    0xaa   0    2     15    4(26%)
 CU1R  40    0xa8   0    2     15    4(26%)
 CU2R  41    0xaa   0    2     15    4(26%)
-----------------------------------------------
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
  2   Full     Voltage 0x1e  0x61  3.1714 V   ok     +3.3V
  3   Full     Voltage 0x1e  0x61  12.428 V   ok     +12V
  4   Full     Voltage 0x1e  0x61  12.428 V   ok     +12V_1
  5   Full     Temp    0x1e  0x61  31.00 C    ok     LM75 Temp
  6   Full     Temp    0x1e  0x61  31.00 C    ok     LM75 Temp2
  7   Full     Fan     0x1e  0x61  2820 RPM   ok     Fan 1
  8   Full     Fan     0x1e  0x61  2940 RPM   ok     Fan 2
  9   Full     Fan     0x1e  0x61  2880 RPM   ok     Fan 3
 10   Full     Fan     0x1e  0x61  2040 RPM   ok     Fan 4
 11   Full     Fan     0x1e  0x61  2040 RPM   ok     Fan 5
 12   Full     Fan     0x1e  0x61  2040 RPM   ok     Fan 6
 13   Full     0xc0    0x1e  0x61  0x00                  0x02  Air Filter
 14   Compact  0xf0    0x1e  0x61  0x10              HS 040 CU1
------------------------------------------------------------------
```

We have
* 2 temperatures
* 3 voltages
* 6 fans

can be translated into

```
file "sensor_ai_ess.template"
{
   pattern { attr	    , sensinst	, type	}
           { TEMP 	  , 1	      	, 1	}
           { TEMP    	, 2	      	, 1	}
           { V		    , 1	      	, 2	}
           { V	    	, 2		      , 2	}
           { V  	  	, 3	      	, 2	}
   	       { FANSPEED	, 1	      	, 4	}
           { FANSPEED	, 2	      	, 4	}
           { FANSPEED	, 3	      	, 4	}
           { FANSPEED	, 4	      	, 4	}
           { FANSPEED	, 5	      	, 4	}
           { FANSPEED	, 6	      	, 4	}
}
```

## fru_pm_ess.substitutions

```console
nat> show_pm
---------------------------------------------------------------
PM1: - unknown
PM2: - online, primary(fru 51)    : budget 80.0 A (alloc 25.3 A avail 54.7 A)
PM3: - unknown
PM4: - unknown
|-------------------------------------------------------------|
|chan  FRU FruId  primPM  secPM  PS1  POn  ENA   MP  PP  Amps |
|-------------------------------------------------------------|
  1   MCH1     3   2       -      y    y    y    y   y   3.5   
  2   MCH2     4   2       -      -    -    -    -   -         
  3    CU1    40   2       -      y    -    y    y   y   7.6   
  4    CU2    41   2       -      y    -    y    y   y   7.6   
  5   AMC1     5   2       -      y    -    y    y   y   6.6   
  6   AMC2     6   2       -      -    -    -    -   -         
  7   AMC3     7   2       -      -    -    -    -   -         
  8   AMC4     8   2       -      -    -    -    -   -         
  9   AMC5     9   2       -      -    -    -    -   -         
 10   AMC6    10   2       -      -    -    -    -   -         
 11   AMC7    11   2       -      -    -    -    -   -         
 12   AMC8    12   2       -      -    -    -    -   -         
 13   AMC9    13   2       -      y    -    y    y   -         
 14  AMC10    14   2       -      -    -    -    -   -         
 15  AMC11    15   2       -      -    -    -    -   -         
 16  AMC12    16   2       -      -    -    -    -   -         
|-------------------------------------------------------------|
```

```console
nat> show_pwrconf
Backplane power policy: REDUNDANCY  -  backplane channel assignment:
-------------------------------------------------------------------------------------------
PChannel: |   1    2    3    4    5    6    7    8    9    10   11   12   13   14   15   16
PM1( -  ) | 
PM2(prim) |   x    x    x    x    x    x    x    x    x    x    x    x    x    x    x    x  
PM3( -  ) | 
PM4(sec ) |   x    x    x    x    x    x    x    x    x    x    x    x    x    x    x    x  
BP Amps:  |  8.0  8.0  8.0  8.0  8.0  8.0  8.0  8.0  8.0  8.0  8.0  8.0  8.0  8.0  8.0  8.0 
-------------------------------------------------------------------------------------------
```

```console
nat> show_sensorinfo 51
Sensor Information for FRU 51 / PM2
==================================================================
  #   SDRType  Sensor Entity Inst  Value   State    Name
------------------------------------------------------------------
  -   MDevLoc          0x0a  0x62                    PM-AC1000
  1   Full     Temp    0x0a  0x62  32 C       ok     T DCDC UPD
  2   Full     Temp    0x0a  0x62  31 C       ok     T PATH UPD
  3   Full     Temp    0x0a  0x62  37 C       ok     T COOLER UPM
  4   Full     Temp    0x0a  0x62  34 C       ok     T TRAFO UPM
  5   Full     Voltage 0x0a  0x62  3.24 V     ok     MP
  6   Full     Voltage 0x0a  0x62  4.98 V     ok     SMP
  7   Full     Voltage 0x0a  0x62  4.98 V     ok     SMPP
  8   Full     Voltage 0x0a  0x62  12.36 V    ok     PP
  9   Full     Voltage 0x0a  0x62  11.46 V    ok     12VHH
 10   Full     Current 0x0a  0x62  6.80 A     ok     Current(Sum)
 11   Full     Current 0x0a  0x62  1.60 A     ok     Ch01 Current
 12   Full     Current 0x0a  0x62  0.00 A     ok     Ch02 Current
 13   Full     Current 0x0a  0x62  1.75 A     ok     Ch03 Current
 14   Full     Current 0x0a  0x62  1.90 A     ok     Ch04 Current
 15   Full     Current 0x0a  0x62  1.75 A     ok     Ch05 Current
 16   Full     Current 0x0a  0x62  0.00 A     ok     Ch06 Current
 17   Full     Current 0x0a  0x62  0.00 A     ok     Ch07 Current
 18   Full     Current 0x0a  0x62  0.00 A     ok     Ch08 Current
 19   Full     Current 0x0a  0x62  0.00 A     ok     Ch09 Current
 20   Full     Current 0x0a  0x62  0.00 A     ok     Ch10 Current
 21   Full     Current 0x0a  0x62  0.00 A     ok     Ch11 Current
 22   Full     Current 0x0a  0x62  0.00 A     ok     Ch12 Current
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

We have
* 4 temperatures
* 5 voltages
* 17 currents

can be translated into
with the following definition type:
* TEMP    : type 1
* Voltage : type 2
* Current : type 3

```
file "sensor_ai_ess.template"
{
   pattern { attr	, sensinst	, type	}
           { TEMP	, 1		, 1	}
           { TEMP	, 2		, 1	}
           { TEMP	, 3		, 1	}
           { TEMP	, 4		, 1	}
           { V		, 1		, 2	}
           { V		, 2		, 2	}
           { V		, 3		, 2	}
           { V		, 4		, 2	}
           { V		, 5		, 2	}
           { I		, 1		, 3	}
           { I		, 2		, 3	}
           { I		, 3		, 3	}
           { I		, 4		, 3	}
           { I		, 5		, 3	}
           { I		, 6		, 3	}
           { I		, 7		, 3	}
           { I		, 8		, 3	}
           { I		, 9		, 3	}
           { I		, 10	, 3	}
	       { I		, 11	, 3	}
           { I		, 12	, 3	}
           { I		, 13	, 3	}
           { I		, 14	, 3	}
           { I		, 15	, 3	}
           { I		, 16	, 3	}
           { I		, 17	, 3	}
 }		
```

## fru_basic_ess.substitutions

```console
nat> show_fruinfo 3 
---------------------------------------
FRU Info for device 3:
---------------------------------------
Common Header    : 0x01 0x00 0x00 0x01 0x07 0x15 0x00 0xe2 
---------------------------------------
Internal Use Area : -
---------------------------------------
Chassis Info Area : -
---------------------------------------
Board Info Area          : at offs=8, len=48
Manufacturer(21)         : N.A.T. GmbH - Germany
Board Name(07)           : NAT-MCH
Serial Number(03)        : 786
Part Number(04)          : 0b23
FRU file ID(00)          :  -
---------------------------------------
Product Info Area        : at offs=56, len=112
Manufacturer(21)         : N.A.T. GmbH - Germany
Product Name(07)         : NAT-MCH
Product Number(04)       : 0b23
Part Version(13)         : V2.1, R150127
Product Serial Number(03): 786
Asset Tag(00)            :  -
FRU file ID(00)          :  -
Customer Info-0 (51)     : MCH FW V2.19.3 Final (r14670) (Sep 18 2017 - 13:47)
---------------------------------------
Multi Record Area  : at offs=168

Record(0): Type ID=0xc0, PICMG Record ID=0x16, offset=0x000, len=11
Module Current Requirements Record:
    Current Draw: 3.5 A

Record(1): Type ID=0xc0, PICMG Record ID=0x80, offset=0x00b, len=194
Header=buf 0x41b1dd7b len 5
 c0 82 bd 04 fd
Data  =buf 0x41b1dd80 len 189
 5a 31 00 80 00 00 1c 01   00 00 00 3c 1e c0 03 00
 1e 00 01 00 00 01 00 00   00 00 00 00 00 00 01 00
 00 00 00 05 00 00 01 00   00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00   fe 9f 02 13 00 e4 00 e4
 00 08 00 00 00 00 00 00   00 00 00 00 00 00 00 00
 00 00 00 1c 00 00 00 10   88 12 40 00 6e 74 70 63
 5f 65 6e 61 00 e4 6b 67   40 00 40 11 4a 39 c0 a8
 00 00 00 4c 00 00 00 40   88 12 40 00 00 00 00 00
 00 00 00 00 00 00 00 00   00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00   00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00   00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00   00 00 00 f1 37
---------------------------------------
```

```console
nat> show_sensorinfo 3
Sensor Information for FRU 3 / MCMC1
==================================================================
  #   SDRType  Sensor Entity Inst  Value   State    Name
------------------------------------------------------------------
  -   MDevLoc          0xc2  0x61                    NAT-MCH-MCMC
  1   Full     Temp    0xc2  0x61  36 C       ok     Temp CPU
  2   Full     Temp    0xc2  0x61  32 C       ok     Temp I/O
  3   Compact  0xf2    0xc2  0x61  0x01              HotSwap
  4   Compact  0x2b    0xc2  0x61  0x00              Version Change
  5   Full     Voltage 0xc2  0x61  1.20 V     ok     Base 1.2V
  6   Full     Voltage 0xc2  0x61  1.51 V     ok     Base 1.5V
  7   Full     Voltage 0xc2  0x61  1.81 V     ok     Base 1.8V
  8   Full     Voltage 0xc2  0x61  2.45 V     ok     Base 2.5V
  9   Full     Voltage 0xc2  0x61  3.360 V    ok     Base 3.3V
 10   Full     Voltage 0xc2  0x61  12.24 V    ok     Base 12V
 11   Full     Current 0xc2  0x61  1.58 A     ok     Base Current
 12   Compact  0xf0    0xc2  0x61  0x10              HS 003 MCMC1
------------------------------------------------------------------
```
