@echo off

:CLEAN_BIN
if NOT EXIST bin GOTO CLEAN_BUILD
@echo Removing 'bin'
rd /s /q bin

:CLEAN_BUILD
if NOT EXIST build GOTO CLEAN_MSVC
@echo Removing 'build'
rd /s /q build

:CLEAN_MSVC
if NOT EXIST msvc GOTO CLEAN_NINJA
@echo Removing 'msvc'
rd /s /q msvc

:CLEAN_NINJA
if NOT EXIST ninja GOTO CLEAN_EXTERNAL
@echo Removing 'ninja'
rd /s /q ninja

:CLEAN_EXTERNAL
if NOT EXIST external GOTO CLEAN_EXIT
@echo Removing 'external'
rd /s /q external

:CLEAN_EXIT
