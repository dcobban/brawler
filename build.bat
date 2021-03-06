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
GOTO PROJECT_BUILD

:PROJECT_BUILD
echo Building '%project_dir%'
cmake --build . --config Debug
GOTO EXIT_BUILD

:EXIT_BUILD
cd ..
GOTO CLEAN_EXIT

:CLEAN_EXIT
