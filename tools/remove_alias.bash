#!/bin/bash
#
#  Copyright (c) 2019  Jeong Han Lee
#  Copyright (c) 2019  European Spallation Source ERIC
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
#   author  : Jeong Han Lee
#   email   : jeonghan.lee@gmail.com
#   date    : Tuesday, January 15 22:57:47 CET 2019
#   version : 0.0.1
#

declare -gr SC_SCRIPT="$(realpath "$0")"
declare -gr SC_SCRIPTNAME=${0##*/}
declare -gr SC_TOP="${SC_SCRIPT%/*}"

TOP=${SC_TOP}/..


function remove_alias
{
    sed '/alias/d' ${TOP}/ipmiComm/Db/$1.db > ${TOP}/template/$1_ess.template
}

declare -ga list=()

list+=( "fru_common" )
list+=( "fru_cu_common" )
list+=( "sensor_ai" )
list+=( "system_chassis_status" )
list+=( "system_common" )
list+=( "system_powerstate_unsupported" ) 

rep="";
for rep in  ${list[@]}; do
    remove_alias "$rep"
done



