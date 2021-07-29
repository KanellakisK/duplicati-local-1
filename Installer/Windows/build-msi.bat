@echo off

rmdir /s /q Duplicati 
del /q Duplicati.msi         rem Could Not Find D:\a\duplicati-local\duplicati-local\Duplicati.msi
del /q Duplicati-32bit.msi   rem δεν εχουν δημιουργηθει τα αρχεια αρα δε μπορει να τα διαγραψει

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
echo ---****---****ΜΠΑΙΝΕΙ ΣΤΙΣ IF---****---****
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
echo ---****---****ΒΓΗΚΕ ΑΠΟ ΤΗΝ ΤΕΛΕΥΤΑΙΑ IF KAI ΘΑ ΚΑΝΕΙ rndir obj,bin---****---****
rmdir /s /q obj      rem The system cannot find the file specified
rmdir /s /q bin      rem The system cannot find the file specified

echo ---****---****ΣΥΝΕΧΙΖΕΙ ,ΔΕ ΜΠΟΡΕΙ ΝΑ ΒΡΕΙ ΤΟ  UpgradeData.wxi.orig, αν βαλω path μονο στο UpgradeData.wxi ειναι invalid syntax  ---****---****
copy Installer/Windows/UpgradeData.wxi UpgradeData.wxi.orig     rem  The system cannot find the file specified

echo ---****---***MΕ ΠΛΗΡΗ PATH EΓΙΝΕ UPDATE TO UpgradeData.wxi---****---****
"Installer/Windows/UpdateVersion.exe" "Installer/Windows/Duplicati/Duplicati.GUI.TrayIcon.exe" "Installer/Windows/UpgradeData.wxi" 

echo ---****---****ΣΥΝΕΧΙΖΕΙ,ΘΑ ΧΤΥΠΗΣΕΙ ΤΟ msbuild x64, ΔΕΝ ΕΧΕΙ ΟΡΙΣΜΑ--****---****
msbuild /property:Configuration=Release /property:Platform=x64    rem error MSB1011: Specify which project or solution file to use because this folder contains more than one project or solution file.

echo ---****---****ΣΥΝΕΧΙΖΕΙ, ΔΕ ΒΡΙΣΚΕΙ ΤΟ Duplicati msi, ΔΕ ΜΠΟΡΕΙ ΝΑ ΚΑΝΕΙ move, ΙΣΩΣ ΕΠΕΙΔΗ ΔΕΝ ΕΧΕΙ ΦΤΙΑΧΤΕΙ Ο ΦΑΚΕΛΟΣ bin---****---****
move bin\x64\Release\Duplicati.msi Duplicati.msi    rem The system cannot find the path specified.

echo ---****---****ΣΥΝΕΧΙΖΕΙ,ΙΔΙΑ ERROR ΜΕ ΠΡΙΝ ΓΙΑ msbuild x86, Duplicati.msi ---****---****
msbuild /property:Configuration=Release /property:Platform=x86      rem MSBUILD : error MSB1008: Only one project can be specified
move bin\x86\Release\Duplicati.msi Duplicati-32bit.msi              rem The system cannot find the path specified.

echo ---****---****ΣΥΝΕΧΙΖΕΙ,ΘΑ ΧΤΥΠΗΣΕΙ ΔΥΟ ΦΟΡΕΣ ΤΟ UpgradeData.wxi.orig, ΔΕ ΤΟ ΒΡΙΣΚΕΙ ΚΑΙ ΔΕ ΜΠΟΡΕΙ ΝΑ ΚΑΝΕΙ copy,del---****---****
copy UpgradeData.wxi.orig "Installer/Windows/UpgradeData.wxi"  rem Could Not Find D:\a\duplicati-local\duplicati-local\UpgradeData.wxi.orig
del UpgradeData.wxi.orig                                       rem Could Not Find D:\a\duplicati-local\duplicati-local\UpgradeData.wxi.orig

rmdir /s /q Duplicati

:EXIT
