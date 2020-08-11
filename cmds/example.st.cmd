
require ipmiComm, 4.2.0

require iocStats, 3.1.16
require recsync, 1.3.0-9705e52
require caPutLog, b544f92
require autosave, 5.10.0

epicsEnvSet("TOP",              "$(E3_CMD_TOP)/..")

epicsEnvSet("DEVICE_IP",        "172.30.4.208")
epicsEnvSet("P",                "$(P=LabS)")
epicsEnvSet("R",                "$(R=Ctrl-MTCA-100)")
epicsEnvSet("PREFIX",           "$(P):$(R)")

epicsEnvSet("ENGINEER",         "anderslindh <anders.lindholsson@ess.eu>")
epicsEnvSet("LOCATION",         "ALO test crate")
epicsEnvSet("IOCNAME",          "$(PREFIX)")

iocshLoad("$(ipmiComm_DIR)mtca9u_std.iocsh",    "PREF=$(PREFIX), SESS=$(PREFIX), INET=$(DEVICE_IP), LOCT=$(LOCATION)")
iocshLoad("$(ipmiComm_DIR)sis8300ku.iocsh",     "PREF=$(P), SESS=$(PREFIX), UNIT=-100:, FRUID=5, ID=Ctrl-SIS8300")
iocshLoad("$(ipmiComm_DIR)ifc14xx.iocsh",       "PREF=$(P), SESS=$(PREFIX), UNIT=-100:, FRUID=6, ID=Ctrl-IFC1420")
iocshLoad("$(ipmiComm_DIR)am90x-x1x.iocsh",     "PREF=$(P), SESS=$(PREFIX), UNIT=-100:, FRUID=7, ID=Ctrl-CPU")
iocshLoad("$(ipmiComm_DIR)evr300.iocsh",        "PREF=$(P), SESS=$(PREFIX), UNIT=-100:, FRUID=8, ID=Ctrl-EVR")

loadIocsh("iocStats.iocsh",     "IOCNAME=$(IOCNAME)")
loadIocsh("recsync.iocsh",      "IOCNAME=$(IOCNAME)")

iocInit()

dbl > "PVs.list"
