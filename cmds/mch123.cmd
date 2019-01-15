require asyn, 4.32.0
require ipmiComm, 4.0.2
require iocStats, 1856ef5


epicsEnvSet("ENGINEER","hanlee x3409")
epicsEnvSet("LOCATION","Rack 1 at ICS Tuna Lab")

epicsEnvSet("IOC", "TunaLab-ipmiTest")

epicsEnvSet("DEV", "$(IOC):R03-DAQ02")
epicsEnvSet("IPPORT_MCH", "10.4.8.123:623 udp")
epicsEnvSet("LOCATION", "ICS Tuna Lab")
epicsEnvSet("NAME", "NAT MCH")


# iocStats
dbLoadRecords("iocAdminSoft.db", "IOC=$(IOC):IocStats")

drvAsynIPPortConfigure ("nat-mch123", "${IPPORT_MCH}",0,0,0)

mchInit("nat-mch123")

dbLoadRecords("shelf_microtca_12slot.db","dev=$(DEV),link=nat-mch123,location=$(LOCATION)")

iocInit()


dbl > "${IOC}_PVs.list"


