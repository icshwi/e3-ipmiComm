
# don't need to require asyn
require ipmiComm,4.2.0

#require iocStats,ae5d083
#require recsync,1.3.0
#require autosave,5.9.0

epicsEnvSet "TOP" "$(E3_CMD_TOP)/.."

epicsEnvSet("ENGINEER","hanlee x3409")
epicsEnvSet("LOCATION","Rack 1 at ICS Tuna Lab")

epicsEnvSet("SESSION", "mtca3u")
epicsEnvSet("IPMISERVER", "10.4.8.126")
epicsEnvSet("IOCNAME", "$(SESSION)")

iocshLoad("$(ipmiComm_DIR)/mtca3u_std.iocsh", "SESS=$(SESSION),INET=$(IPMISERVER),P=$(SESSION)-IPMI:SUB-SEC,LOCT=$(LOCATION)")

#loadIocsh("iocStats.iocsh", "IOCNAME=$(IOCNAME)")
#loadIocsh("recsync.iocsh",  "IOCNAME=$(IOCNAME)")
#loadIocsh("autosave.iocsh", "IOCNAME=autosave, AS_TOP=$(TOP)")


iocInit()

dbl > "$(TOP)/$(IOCNAME)_PVs.list"