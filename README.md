e3-ipmiComm
=====
ESS Site-specific EPICS module : ipmiComm

```
$ make init
$ make build
$ make install
```

## Site-Specific DB files

We removed the alias, and simplify substitutions files. They are located in [template](https://github.com/icshwi/e3-ipmiComm/tree/master/template) and will be infalted and install into e3. 

```
bash tools/remove_alias.bash 
```

[ESS Specific DB Files](template/README.md)


## MCH access

We uses the MOXA to MCH with a debug cable, so one can access the MCH via

```
telnet 10.4.8.102 4001
```


Disable all debug messages, reboot.... mch, type z..
```
 cmu_dbg                  - configure CM upper part debug
  csif_dbg                 - configure CM/ShM interface debug
  imsg_dbg                 - configure IPMI MSG debug
  lshm_dbg                 - configure local ShM debug
  red_dbg                  - configure redundancy debug
  rmcp_dbg                 - configure RMCP interface debug
  sdrrep_dbg               - configure SDR repository debug
  sel_dbg                  - configure SEL debug
```




```
nat> csif_dbg

CSIF debug level codes:
  ERR debugs      : 0x00000002 (enabled)
  WARN debugs     : 0x00000004 (enabled)
  INFO debugs     : 0x00000008 (disabled)
  DETAIL debugs   : 0x00000010 (disabled)
  DATA debugs     : 0x00000100 (disabled)
  current setting : 0x00000006
Enter debug state (RET=6/0x6): 0

nat> csif_dbg

CSIF debug level codes:
  ERR debugs      : 0x00000002 (disabled)
  WARN debugs     : 0x00000004 (disabled)
  INFO debugs     : 0x00000008 (disabled)
  DETAIL debugs   : 0x00000010 (disabled)
  DATA debugs     : 0x00000100 (disabled)
  current setting : 0x00000000
Enter debug state (RET=0/0x0):

nat> sel_dbg

SEL debug level codes:
  ERR debugs      : 0x00000002 (enabled)
  WARN debugs     : 0x00000004 (enabled)
  INFO debugs     : 0x00000008 (disabled)
  DETAIL debugs   : 0x00000010 (disabled)
  DATA debugs     : 0x00000100 (disabled)
  current setting : 0x00000006
Enter debug state (RET=6/0x6): 0      
nat> sel_dbg

SEL debug level codes:
  ERR debugs      : 0x00000002 (disabled)
  WARN debugs     : 0x00000004 (disabled)
  INFO debugs     : 0x00000008 (disabled)
  DETAIL debugs   : 0x00000010 (disabled)
  DATA debugs     : 0x00000100 (disabled)
  current setting : 0x00000000
Enter debug state (RET=0/0x0): 

nat> imsg_dbg

IPMI_MSG debug level codes:
  FATAL debugs        : 0x00000001 (enabled)
  ERR debugs          : 0x00000002 (enabled)
  WARN debugs         : 0x00000004 (enabled)
  INFO debugs         : 0x00000008 (disabled)
  DETAIL debugs       : 0x00000010 (disabled)
  DATA debugs         : 0x00000100 (disabled)
  MSG specific debugs : 0x00100000 (disabled)
  current setting     : 0x00000007
Enter debug state (RET=7/0x7): 0

nat> lshm_dbg

LSHM debug level codes:
  ERR debugs      : 0x00000002 (enabled)
  WARN debugs     : 0x00000004 (enabled)
  INFO debugs     : 0x00000008 (disabled)
  DETAIL debugs   : 0x00000010 (disabled)
  DATA debugs     : 0x00000100 (disabled)
  EVT debugs      : 0x00010000 (enabled)
  current setting : 0x00010006
Enter debug state (RET=65542/0x10006): 0
nat> lshm_dbg

LSHM debug level codes:
  ERR debugs      : 0x00000002 (disabled)
  WARN debugs     : 0x00000004 (disabled)
  INFO debugs     : 0x00000008 (disabled)
  DETAIL debugs   : 0x00000010 (disabled)
  DATA debugs     : 0x00000100 (disabled)
  EVT debugs      : 0x00010000 (disabled)
  current setting : 0x00000000
Enter debug state (RET=0/0x0): 


```