@echo off
if "%~1" == "" (
    echo Incorrect number of arguments.
    exit /b -1
)

set DIR_NAME=build-v%~1

if exist "%DIR_NAME%" (
	echo This version already exists
	exit /b -1
)

MD "%DIR_NAME%"

cd src/BackendApi
start /wait dotnet publish --configuration Release
if %ERRORLEVEL% NEQ 0 (
	echo "Build failed"
    exit /b -1
)

cd ..
cd FrontendTask
start /wait dotnet publish --configuration Release
if %ERRORLEVEL% NEQ 0 (
	echo "Build failed"
    exit /b -1
)

cd ..
cd ..

mkdir "%DIR_NAME%/BackendApi"
mkdir "%DIR_NAME%/FrontendTask"

xcopy src\BackendApi\bin\Release\netcoreapp3.1\publish "%DIR_NAME%"\BackendApi\ /s /e
xcopy src\FrontendTask\bin\Release\netcoreapp3.1\publish "%DIR_NAME%"\FrontendTask\ /s /e
xcopy start.cmd "%DIR_NAME%"
xcopy stop.cmd "%DIR_NAME%"

echo BUILD SUCCESS
echo GO TO %DIR_NAME% AND RUN "start.cmd"

Pause