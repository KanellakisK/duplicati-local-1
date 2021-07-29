@echo off

rmdir /s /q Duplicati 
del /q Duplicati.msi  rem Could Not Find D:\a\duplicati-local\duplicati-local\Duplicati.msi
del /q Duplicati-32bit.msi rem den exoun dhmiourgithei ara de mporei na ta diagrapsei

IF NOT EXIST "%1" (
	echo File not found, please supply a zip file with the build as the first argument
	goto EXIT
)

call "%VS140COMNTOOLS%vsvars32.bat"

 7z x -oDuplicati %1

IF EXIST "..\oem" (
	echo Installing OEM files
	xcopy ..\oem\* Duplicati\webroot\oem /e /s /y /i
)

IF EXIST "..\..\oem" (
	echo Installing OEM files
	xcopy ..\..\oem\* Duplicati\webroot\ /e /s /y /i
)

IF EXIST "..\..\..\oem" (
	echo Installing OEM files
	xcopy ..\..\..\oem\* Duplicati\webroot\ /e /s /y /i
)

IF EXIST "..\oem-app-name.txt" (
	echo Installing OEM override file
	xcopy ..\oem-app-name.txt Duplicati /e /s /y /i
)

IF EXIST "..\..\oem-app-name.txt" (
	echo Installing OEM override file
	xcopy ..\..\oem-app-name.txt Duplicati /e /s /y /i
)

IF EXIST "..\..\..\oem-app-name.txt" (
	echo Installing OEM override file
	xcopy ..\..\..\oem-app-name.txt Duplicati /e /s /y /i
)

IF EXIST "..\oem-update-url.txt" (
	echo Installing OEM override file
	xcopy ..\oem-update-url.txt Duplicati /e /s /y /i
)

IF EXIST "..\..\oem-update-url.txt" (
	echo Installing OEM override file
	xcopy ..\..\oem-update-url.txt Duplicati /e /s /y /i
)

IF EXIST "..\..\..\oem-update-url.txt" (
	echo Installing OEM override file
	xcopy ..\..\..\oem-update-url.txt Duplicati /e /s /y /i
)

IF EXIST "..\oem-update-key.txt" (
	echo Installing OEM override file
	xcopy ..\oem-update-key.txt Duplicati /e /s /y /i
)

IF EXIST "..\..\oem-update-key.txt" (
	echo Installing OEM override file
	xcopy ..\..\oem-update-key.txt Duplicati /e /s /y /i
)

IF EXIST "..\..\..\oem-update-key.txt" (
	echo Installing OEM override file
	xcopy ..\..\..\oem-update-key.txt Duplicati /e /s /y /i
)

IF EXIST "..\oem-update-readme.txt" (
	echo Installing OEM override file
	xcopy ..\oem-update-readme.txt Duplicati /e /s /y /i
)

IF EXIST "..\..\oem-update-readme.txt" (
	echo Installing OEM override file
	xcopy ..\..\oem-update-readme.txt Duplicati /e /s /y /i
)

IF EXIST "..\..\..\oem-update-readme.txt" (
	echo Installing OEM override file
	xcopy ..\..\..\oem-update-readme.txt Duplicati /e /s /y /i
)

IF EXIST "..\oem-update-installid.txt" (
	echo Installing OEM override file
	xcopy ..\oem-update-installid.txt Duplicati /e /s /y /i
)

IF EXIST "..\..\oem-update-installid.txt" (
	echo Installing OEM override file
	xcopy ..\..\oem-update-installid.txt Duplicati /e /s /y /i
)

IF EXIST "..\..\..\oem-update-installid.txt" (
	echo Installing OEM override file
	xcopy ..\..\..\oem-update-installid.txt Duplicati /e /s /y /i
)

rmdir /s /q obj
rmdir /s /q bin

copy UpgradeData.wxi UpgradeData.wxi.orig                              rem  The system cannot find the file specified
./Installer/Windows/Duplicati/UpdateVersion.exe Duplicati\Duplicati.GUI.TrayIcon.exe UpgradeData.wxi rem 'UpdateVersion.exe' is not recognized as an internal or external command,

msbuild /property:Configuration=Release /property:Platform=x64
move bin\x64\Release\Duplicati.msi Duplicati.msi

msbuild /property:Configuration=Release /property:Platform=x86  rem MSBUILD : error MSB1008: Only one project can be specified
move bin\x86\Release\Duplicati.msi Duplicati-32bit.msi

copy UpgradeData.wxi.orig UpgradeData.wxi  rem Could Not Find D:\a\duplicati-local\duplicati-local\UpgradeData.wxi.orig
del UpgradeData.wxi.orig                   rem Could Not Find D:\a\duplicati-local\duplicati-local\UpgradeData.wxi.orig

rmdir /s /q Duplicati

:EXIT
