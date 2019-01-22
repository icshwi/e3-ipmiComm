#
#  Copyright (c) 2019            Jeong Han Lee
#  Copyright (c) 2017 - Present  European Spallation Source ERIC
#
#  The program is free software: you can redistribute
#  it and/or modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation, either version 2 of the
#  License, or any newer version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#
#  You should have received a copy of the GNU General Public License along with
#  this program. If not, see https://www.gnu.org/licenses/gpl-2.0.txt
#
# 
# Author  : Jeong Han Lee
# email   : han.lee@esss.se
# Date    : Wednesday, January 16 11:35:46 CET 2019
# version : 0.0.3

## The following lines are mandatory, please don't change them.
where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(E3_REQUIRE_TOOLS)/driver.makefile
include $(E3_REQUIRE_CONFIG)/DECOUPLE_FLAGS



## Exclude linux-ppc64e6500
EXCLUDE_ARCHS = linux-ppc64e6500


ifneq ($(strip $(ASYN_DEP_VERSION)),)
asyn_VERSION=$(ASYN_DEP_VERSION)
endif

# 
USR_CFLAGS   += -Wno-unused-but-set-variable
USR_CPPFLAGS += -Wno-unused-but-set-variable
#

APP:=.
APPDB:=$(APP)/Db
APPSRC:=$(APP)/src

USR_INCLUDES += -I$(where_am_I)$(APPSRC)


TEMPLATES += $(wildcard $(APPDB)/*.db)
TEMPLATES += $(wildcard $(APPDB)/*.template)


DBDS      += $(APPSRC)/ipmiComm.dbd
#DBDS      += $(APPSRC)/drvMchServerPc.dbd
#DBDS      += $(APPSRC)/drvMchPicmg.dbd


SOURCES   += $(APPSRC)/drvMch.c
SOURCES   += $(APPSRC)/devMch.c
SOURCES   += $(APPSRC)/drvMchMsg.c
SOURCES   += $(APPSRC)/ipmiMsg.c
SOURCES   += $(APPSRC)/ipmiDef.c
SOURCES   += $(APPSRC)/picmgDef.c
SOURCES   += $(APPSRC)/drvMchPicmg.c
SOURCES   += $(APPSRC)/drvMchServerPc.c
SOURCES   += $(APPSRC)/subIpmiComm.c

SCRIPTS += $(wildcard ../iocsh/*.iocsh)

# Order is matter
SUBS += $(APPDB)/fru_basic_ess.substitutions
#SUBS += $(APPDB)/fru_extended_ess.substitutions
SUBS += $(wildcard $(APPDB)/others_*_ess.substitutions)
SUBS += $(wildcard $(APPDB)/evr_*_ess.substitutions)
SUBS += $(wildcard $(APPDB)/evm_*_ess.substitutions)
SUBS += $(wildcard $(APPDB)/cpu_*_ess.substitutions)
SUBS += $(wildcard $(APPDB)/mch_*_ess.substitutions)
SUBS += $(wildcard $(APPDB)/cu_*_ess.substitutions)
SUBS += $(wildcard $(APPDB)/pm_*_ess.substitutions)
SUBS += $(wildcard $(APPDB)/*-ess.substitutions)


USR_DBFLAGS += -I . -I ..
USR_DBFLAGS += -I $(EPICS_BASE)/db
USR_DBFLAGS += -I $(APPDB)


db: $(SUBS) $(TMPS)

$(SUBS):
	@printf "Inflating database ... %44s >>> %40s \n" "$@" "$(basename $(@)).db"
	@rm -f  $(basename $(@)).db.d  $(basename $(@)).db
	@$(MSI) -D $(USR_DBFLAGS) -o $(basename $(@)).db -S $@ > $(basename $(@)).db.d
	@$(MSI)    $(USR_DBFLAGS) -o $(basename $(@)).db -S $@

$(TMPS):
	@printf "Inflating database ... %44s >>> %40s \n" "$@" "$(basename $(@)).db"
	@rm -f  $(basename $(@)).db.d  $(basename $(@)).db
	@$(MSI) -D $(USR_DBFLAGS) -o $(basename $(@)).db $@  > $(basename $(@)).db.d
	@$(MSI)    $(USR_DBFLAGS) -o $(basename $(@)).db $@


.PHONY: db $(SUBS) $(TMPS)

#
vlibs:
.PHONY: vlibs

#
