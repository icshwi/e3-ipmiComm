#
#  Copyright (c) 2017 - Present  European Spallation Source ERICq
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
# Author  : icssev
# email   : @esss.se
# Date    : generated by 2017Dec11-1418-04CET
# version : 0.0.0 
#
# template file is generated by ./prepare_module.bash with 39f5559c9abf4ccf9a3e6574d78228e1b841909a
#
TOP:=$(CURDIR)

ifneq (,$(findstring dev,$(MAKECMDGOALS)))
include $(TOP)/configure/CONFIG_DEV
else
include $(TOP)/configure/CONFIG
endif

-include $(TOP)/$(E3_ENV_NAME)/$(E3_ENV_NAME)

include $(TOP)/configure/MK_DEFINES

include $(TOP)/configure/BUILD_E3

include $(TOP)/configure/BUILD_DB

# Build Rule for Community EPICS Building
include $(TOP)/configure/BUILD_EPICS

# Build Rule for Development Mode
ifneq (,$(findstring dev,$(MAKECMDGOALS)))
include $(TOP)/configure/BUILD_DEV
endif

