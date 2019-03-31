@echo off

:CREATE_BUILD_DIR
IF EXIST build GOTO PROJECT_GENERATE
mkdir build
GOTO PROJECT_GENERATE

:PROJECT_GENERATE
echo Generating Projects
cd build
cmake -G "Visual Studio 15 2017 Win64" ..
GOTO PROJECT_BUILD

:PROJECT_BUILD
echo Building Projects
cmake --build . --config Release
GOTO EXIT_BUILD

:EXIT_BUILD
cd ..