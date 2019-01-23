
# don't need to require asyn
require ipmiComm,4.2.0
require iocStats,ae5d083
#require recsync,1.3.0
#require autosave,5.9.0

epicsEnvSet "TOP" "$(E3_CMD_TOP)/.."

epicsEnvSet("ENGINEER","hanlee x3409")


## SESSION name must be lowercase
epicsEnvSet("SESS_MTCA9U", "mtca9u")
epicsEnvSet("SERV_MTCA9U", "10.4.8.123")
epicsEnvSet("PREF_MTCA9U", "$(SESS_MTCA9U)-IPMI:SUB-SEC")
epicsEnvSet("LOCT_MTCA9U", "Rack 2 at ICS Tuna Lab")

iocshLoad("$(ipmiComm_DIR)/mtca9u_std.iocsh", "SESS=$(SESS_MTCA9U),INET=$(SERV_MTCA9U),PREF=$(PREF_MTCA9U),LOCT=$(LOCT_MTCA9U)")
 
# This system has only one ifc1410 board and one struck board
iocshLoad("$(ipmiComm_DIR)/ifc14xx.iocsh",    "SESS=$(SESS_MTCA9U),PREF=$(PREF_MTCA9U),UNIT=1,FRUID=12")
iocshLoad("$(ipmiComm_DIR)/sis8300ku.iocsh",  "SESS=$(SESS_MTCA9U),PREF=$(PREF_MTCA9U),UNIT=1,FRUID=8")


epicsEnvSet("SESS_MTCA3UA", "mtca3ua")
epicsEnvSet("SERV_MTCA3UA", "10.4.8.126")
epicsEnvSet("PREF_MTCA3UA", "$(SESS_MTCA3UA)-IPMI:SUB-SEC")
epicsEnvSet("LOCT_MTCA3UA", "Rack 1 at ICS Tuna Lab")

iocshLoad("$(ipmiComm_DIR)/mtca3u_std.iocsh", "SESS=$(SESS_MTCA3UA),INET=$(SERV_MTCA3UA),PREF=$(PREF_MTCA3UA),LOCT=$(LOCT_MTCA3UA)")


epicsEnvSet("SESS_MTCA3UB", "mtca3ub")
epicsEnvSet("SERV_MTCA3UB", "10.4.8.127")
epicsEnvSet("PREF_MTCA3UB", "$(SESS_MTCA3UB)-IPMI:SUB-SEC")
epicsEnvSet("LOCT_MTCA3UB", "Rack 1 at ICS Tuna Lab")

iocshLoad("$(ipmiComm_DIR)/mtca3u_std.iocsh", "SESS=$(SESS_MTCA3UB),INET=$(SERV_MTCA3UB),PREF=$(PREF_MTCA3UB),LOCT=$(LOCT_MTCA3UB)")

epicsEnvSet("IOCNAME", "mtca9u3u-test")
loadIocsh("iocStats.iocsh", "IOCNAME=$(IOCNAME)")
#loadIocsh("recsync.iocsh",  "IOCNAME=$(IOCNAME)")
#loadIocsh("autosave.iocsh", "IOCNAME=autosave, AS_TOP=$(TOP)")


iocInit()

dbl > "$(TOP)/$(IOCNAME)_PVs.list"
