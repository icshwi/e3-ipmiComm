# ESS MTCA Cooling Unit (CU)

## Type 1 : Schroff uTCA CU for 9U MTCA Crate

* https://schroff.nvent.com/en/schroff/microtca/11850-026-1
* https://schroff.nvent.com/wcsstore/ExtendedSitesCatalogAssetStore/Attachment/SchroffAttachments/Documents/63972-328.pdf

```
# Sensor Information for FRU 41 / CU2
# ==================================================================
#   #   SDRType  Sensor Entity Inst  Value   State    Name
# ------------------------------------------------------------------
#   -   MDevLoc          0x1e  0x62                    Schroff uTCA CU
#   0   Full     0xf2    0x1e  0x62  0x01              Hot Swap
#   1   Full     0xf1    0x1e  0x62  0x88 0xc0 0x08   IPMB Physical
#   2   Full     Voltage 0x1e  0x62  3.1857 V   ok     +3.3V
#   3   Full     Voltage 0x1e  0x62  12.428 V   ok     +12V
#   4   Full     Voltage 0x1e  0x62  12.428 V   ok     +12V_1
#   5   Full     Temp    0x1e  0x62  34.00 C    ok     LM75 Temp
#   6   Full     Temp    0x1e  0x62  34.00 C    ok     LM75 Temp2
#   7   Full     Fan     0x1e  0x62  3000 RPM   ok     Fan 1
#   8   Full     Fan     0x1e  0x62  3000 RPM   ok     Fan 2
#   9   Full     Fan     0x1e  0x62  3000 RPM   ok     Fan 3
#  10   Full     Fan     0x1e  0x62  1980 RPM   ok     Fan 4
#  11   Full     Fan     0x1e  0x62  1920 RPM   ok     Fan 5
#  12   Full     Fan     0x1e  0x62  1920 RPM   ok     Fan 6
#  13   Full     0xc0    0x1e  0x62  0x00              0x02  Air Filter
#  14   Compact  0xf0    0x1e  0x62  0x10              HS 041 CU2
# ------------------------------------------------------------------
```

* cu_type1_ess.substitutions

* If a fan fails or the connection to the MCH is lost, the EMMC increases the fan speed to the maximum.

* Top View of CU

```
 Real
-------
|6 5 4|   RTM Section
|3 2 1|   AMC Section
-------
 Front
```

* Front View of Shroff MTCA 9U Crate

```
   TOP
----------
|  CU1   |   FRU 40
----------
|        |
|  AMCs  |
|        |
----------
|  CU2   |   FRU 41
----------
  Bottom
```

## Type 2 : Schroff uTCA CU for 3U MTCA Crate

```console
nat> show_sensorinfo 40
Sensor Information for FRU 40 / CU1
==================================================================
  #   SDRType  Sensor Entity Inst  Value   State    Name
------------------------------------------------------------------
  -   MDevLoc          0x1e  0x61                    Schroff uTCA CU
  0   Full     0xf2    0x1e  0x61  0x01              Hot Swap
  1   Full     0xf1    0x1e  0x61  0x88 0xc0 0x08   IPMB Physical
  2   Full     Voltage 0x1e  0x61  3.3144 V   ok     +3.3V
  3   Full     Voltage 0x1e  0x61  12.648 V   ok     +12V
  4   Full     Voltage 0x1e  0x61  12.703 V   ok     +12V_1
  5   Full     Temp    0x1e  0x61  36.00 C    ok     LM75 Temp
  6   Full     Temp    0x1e  0x61  37.00 C    ok     LM75 Temp2
  7   Full     Fan     0x1e  0x61  12480 RPM  ok     Fan 1
  8   Full     Fan     0x1e  0x61  9720 RPM   ok     Fan 2
  9   Full     Fan     0x1e  0x61  12240 RPM  ok     Fan 3
 10   Full     Fan     0x1e  0x61  9720 RPM   ok     Fan 4
 11   Full     0xc0    0x1e  0x61  0x00              0x02  Air Filter
 12   Compact  0xf0    0x1e  0x61  0x10              HS 040 CU1
------------------------------------------------------------------
```

* cu_type2_ess.substitutions

