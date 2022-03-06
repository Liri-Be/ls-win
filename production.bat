@echo off
setlocal enabledelayedexpansion  

:Set_vars
:: set the vars for the program
set data=%3
set dirname=%4

:: set source dir and dest dir, if user didn't enter source use current dir
if not [%1] == [] (set source=%1) else (set source=%CD%)
if [%2] == [] (goto Mkdir_dest) else (
	set dest=%2
	goto Finish_set_vars)

:Mkdir_dest
:: if user didn't enter dest create new one
echo here
set dest=C:\prod_temp
if not exist %dest% (mkdir %dest%)


:Finish_set_vars
:: set the rest of the vars
set files_name=%dest%\*
set path_insta=%source%\install.ins


:Check_source
:: check if the source exists
if exist %source% (goto Check_dest) else (
	echo Source doesn't exist
	goto Exit)


:Check_dest
:: check if the dest exists
if exist %dest% (goto Del_files_in_dest) else (
	echo Dest doesn't exist
	goto Exit)


:Del_files_in_dest
:: delete all files in dest
if exist %files_name% (del %files_name% /q)
goto Check_install


:Check_install
:: check if the install.ins exists
if exist %path_insta% (goto Make_files) else (
	echo Missing install.ins file in %source%
	goto Exit)


:Make_files
:: make .run file for each name in install.ins
set /A index=0
FOR /F "tokens=* delims=" %%x in (%path_insta%) DO (
	echo rem export >> %dest%\%%x.run
	echo export %%x >> %dest%\%%x.run
	if not [%data%] == [] (echo %data% >> %dest%\%%x.run)
	echo export finished
	:: add a call for ls.py (dir of dest) in .run file
	echo "ls.bat %dest%" >> %dest%\%%x.run
)


:LS
:: if user wanted run ls in a dir of their choice
if not [%dirname%] == [] (ls.bat %dirname%) else (echo 4th parameter isn't set)


:Exit
echo finished
