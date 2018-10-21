#!/bin/sh
export ORACLE_SID="tcheprasovaelenap3402" #SID
export ORACLE_HOME="/u01/app/oracle/product/11.2.0/xe"
export PATH=${PATH}:${ORACLE_HOME}/bin
export NLS_LANG="AMERICAN_AMERICA.UTF8"
export ORADATA="/u01/huk07/wetlaw"

# create dirs
if [ ! -e "$ORADATA" ]; then
	mkdir -p "$ORADATA"
	mkdir "$ORADATA/node01"
	mkdir "$ORADATA/node02"
	mkdir "$ORADATA/node03"
	mkdir "$ORADATA/node04"
	mkdir "$ORADATA/flash_recovery_area"
fi

cp "init$ORACLE_SID.ora" "$ORACLE_HOME/dbs/"
sqlplus /nolog @create_db.sql
