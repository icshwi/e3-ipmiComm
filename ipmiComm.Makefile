

where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(REQUIRE_TOOLS)/driver.makefile


# 
USR_CFLAGS   += -Wno-unused-but-set-variable
USR_CPPFLAGS += -Wno-unused-but-set-variable
#


APP:=.
APPDB:=$(APP)/Db
APPSRC:=$(APP)/src

USR_INCLUDES += -I$(where_am_I)/$(APPSRC)


# Even if we convert template and substitutions files to db,
# I would like to put them into e3 environment
# in order to study them carefully
# 
TEMPLATES += $(wildcard $(APPDB)/*.db)
TEMPLATES += $(wildcard $(APPDB)/*.template)
TEMPLATES += $(wildcard $(APPDB)/*.substitutions)


DBDS      += $(APPSRC)/ipmiComm.dbd
DBDS      += $(APPSRC)/drvMchServerPc.dbd
DBDS      += $(APPSRC)/drvMchPicmg.dbd


SOURCES   += $(APPSRC)/drvMch.c
SOURCES   += $(APPSRC)/devMch.c
SOURCES   += $(APPSRC)/drvMchMsg.c
SOURCES   += $(APPSRC)/ipmiMsg.c
SOURCES   += $(APPSRC)/ipmiDef.c
SOURCES   += $(APPSRC)/picmgDef.c
SOURCES   += $(APPSRC)/drvMchPicmg.c
SOURCES   += $(APPSRC)/drvMchServerPc.c
SOURCES   += $(APPSRC)/subIpmiComm.c



EPICS_BASE_HOST_BIN = $(EPICS_BASE)/bin/$(EPICS_HOST_ARCH)
MSI =  $(EPICS_BASE_HOST_BIN)/msi


USR_DBFLAGS += -I . -I ..
USR_DBFLAGS += -I$(EPICS_BASE)/db
USR_DBFLAGS += -I$(APPDB)


# Order is matter

SUBS += $(APPDB)/fru_basic.substitutions
SUBS += $(APPDB)/fru_extended.substitutions
SUBS += $(APPDB)/fru_pm.substitutions
SUBS += $(APPDB)/fru_cu.substitutions
SUBS  = $(APPDB)/fru_atca_fb.substitutions
SUBS += $(APPDB)/fru_atca_rtm.substitutions

SUBS += $(APPDB)/server_pc.substitutions
SUBS += $(APPDB)/shelf_atca_7slot.substitutions
SUBS += $(APPDB)/shelf_microtca_12slot.substitutions

# Maybe we will create ESS one based on them
SUBS += $(APPDB)/server_pc_lcls.substitutions
SUBS += $(APPDB)/shelf_atca_7slot_lcls.substitutions
SUBS += $(APPDB)/shelf_microtca_12slot_lcls.substitutions
SUBS += $(APPDB)/system_common_lcls.substitutions


TEMS = $(wildcard $(APPDB)/*.template)


db: $(SUBS) $(TEMS)

$(SUBS): 
	@printf "Inflating database ... %44s >>> %40s \n" "$@" "$(basename $(@)).db"
	@rm -f  $(basename $(@)).db.d  $(basename $(@)).db
	@$(MSI) -D $(USR_DBFLAGS) -o $(basename $(@)).db -S $@  > $(basename $(@)).db.d
	@$(MSI)    $(USR_DBFLAGS) -o $(basename $(@)).db -S $@

$(TEMS): 
	@printf "Inflating database ... %44s >>> %40s \n" "$@" "$(basename $(@)).db"
	@rm -f  $(basename $(@)).db.d  $(basename $(@)).db
	@$(MSI) -D $(USR_DBFLAGS) -o $(basename $(@)).db $@  > $(basename $(@)).db.d
	@$(MSI)    $(USR_DBFLAGS) -o $(basename $(@)).db $@



.PHONY: db $(SUBS) $(TEMS) 
