#!/bin/bash

declare -gr SC_SCRIPT="$(realpath "$0")"
declare -gr SC_SCRIPTNAME=${0##*/}
declare -gr SC_TOP="${SC_SCRIPT%/*}"

TOP=${SC_TOP}/..


function remove_alias
{
    sed '/alias/d' ${TOP}/ipmiComm/Db/$1.db > ${TOP}/template/$1_ess.db
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



