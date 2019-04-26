@echo off

for %%I in (.) do set project_dir=%%~nxI

:CREATE_BUILD_DIR
IF EXIST build GOTO PROJECT_GENERATE
mkdir build
GOTO PROJECT_GENERATE

:PROJECT_GENERATE
echo Generating VS2017 Projects
cd build
cmake -Wno-dev -G "Visual Studio 15 2017 Win64" ..
GOTO OPEN_SOLUTION

:OPEN_SOLUTION
rem cmake --open . 
GOTO EXIT_BUILD

:EXIT_BUILD
cd ..
GOTO CLEAN_EXIT

:CLEAN_EXIT
