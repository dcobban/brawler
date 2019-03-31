@echo off

:CLEAN_BIN
@echo Removing 'bin'
if NOT EXIST bin GOTO CLEAN_BUILD
rd /s /q bin

:CLEAN_BUILD
@echo Removing 'build'
if NOT EXIST build GOTO CLEAN_EXTERNAL
rd /s /q build

:CLEAN_EXTERNAL
@echo Removing 'external'
if NOT EXIST external GOTO CLEAN_EXIT
rd /s /q external

:CLEAN_EXIT