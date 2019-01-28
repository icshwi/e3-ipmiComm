
# don't need to require asyn
require ipmiComm,4.2.0
require iocStats,ce06a71
#require recsync,1.3.0
#require autosave,5.9.0

epicsEnvSet "TOP" "$(E3_CMD_TOP)/.."

epicsEnvSet("ENGINEER","hanlee x3409")

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

epicsEnvSet("IOCNAME", "mtca3u-test")
iocshLoad("$(iocStats_DIR)/iocStats.iocsh", "IOCNAME=$(IOCNAME)")

#iocshLoad("$(recsync_DIR)/recsync.iocsh",  "IOCNAME=$(IOCNAME)")
#iocshLoad("$(autosave_DIR)/autosave.iocsh", "IOCNAME=autosave, AS_TOP=$(TOP)")

iocInit()


dbl > "$(TOP)/$(IOCNAME)_PVs.list"
