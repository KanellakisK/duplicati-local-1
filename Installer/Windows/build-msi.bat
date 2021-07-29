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
echo ---****---****MPAINEI STIS IF---****---****
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
echo ---****---****PAEI STHN TELEUTAIA IF---****---****
IF EXIST "..\..\..\oem-update-installid.txt" (
	echo Installing OEM override file
	xcopy ..\..\..\oem-update-installid.txt Duplicati /e /s /y /i
)
echo ---****---****VGHKE APO THN TELEUTAIA IF KAI THA KANEI rmdir obj kai bin---****---****
rmdir /s /q obj
rmdir /s /q bin

echo ---****---****EKANE rmdir obj kai bin,THA XTYPHSEI TO copy Upgradedata---****---****
copy UpgradeData.wxi UpgradeData.wxi.orig                              rem  The system cannot find the file specified

echo ---****---****SYNEXIZEI KAI TWRA THA XTYPHSEI TO UpdateVersion.exe---****---****
UpdateVersion.exe Duplicati\Duplicati.GUI.TrayIcon.exe UpgradeData.wxi rem 'UpdateVersion.exe' is not recognized as an internal or external command,


echo ---****---****SYNEXIZEI,THA XTYPHSEI TO msbuild x64 DEN EXEI ORISMA ARXEIO---****---****
msbuild /property:Configuration=Release /property:Platform=x64

echo ---****---****SYNEXIZEI,ISWS NA MH VREI TO Duplicati msi, DE MPOREI NA KANEI move---****---****
move bin\x64\Release\Duplicati.msi Duplicati.msi

echo ---****---****SYNEXIZEI,IDIA ERROR ME PRIN GIA msbuild x86,Duplicati.msi---****---****
msbuild /property:Configuration=Release /property:Platform=x86  rem MSBUILD : error MSB1008: Only one project can be specified
move bin\x86\Release\Duplicati.msi Duplicati-32bit.msi

echo ---****---****SYNEXIZEI,THA XTYPHSEI DYO FORES TO UpgradeData.wxi.orig, DE TO VRISKEI KAI DE MPOREI NA KANEI copy,del---****---****
copy UpgradeData.wxi.orig UpgradeData.wxi  rem Could Not Find D:\a\duplicati-local\duplicati-local\UpgradeData.wxi.orig
del UpgradeData.wxi.orig                   rem Could Not Find D:\a\duplicati-local\duplicati-local\UpgradeData.wxi.orig

rmdir /s /q Duplicati

:EXIT
