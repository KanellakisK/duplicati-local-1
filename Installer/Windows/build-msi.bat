@echo off

rem ta del einai sxolio giati den exoyn dhmiourgithei ta arxeia kai de mporei na ta diagrapsei

rmdir /s /q Duplicati
rem del /q Duplicati.msi
rem del /q Duplicati-32bit.msi

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

rem 3 mhnymata The system cannot find the file specified. einai gia tis grammes ana dyo

rem copy UpgradeData.wxi UpgradeData.wxi.orig
rem UpdateVersion.exe Duplicati\Duplicati.GUI.TrayIcon.exe UpgradeData.wxi

msbuild /property:Configuration=Release /property:Platform=x64
rem move bin\x64\Release\Duplicati.msi Duplicati.msi

msbuild /property:Configuration=Release /property:Platform=x86 rem error msb1011
rem move bin\x86\Release\Duplicati.msi Duplicati-32bit.msi

copy UpgradeData.wxi.orig UpgradeData.wxi
del UpgradeData.wxi.orig

rmdir /s /q Duplicati

:EXIT
