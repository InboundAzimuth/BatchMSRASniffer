rem Coded By: Jasper Vortac
rem Date 2015-09-15
rem No Updates Currently
@echo off
cls
:start
cls
set Ins_Dir=%userprofile%\Desktop\InvitationForHelp
ECHO Thank you for chosing MSRA from Hidden Server Services
ECHO Please make a selection below:
ECHO =======================================
ECHO -
ECHO 1) Setup Remote Assistance 
ECHO 2) Create Invitation And Password For AssistancePassword/Invitation
ECHO 3) Offer Assistance And Accept 
ECHO 4) Exit
ECHO -

:Start1
set /p op=Input Option: 
if "%op%"=="1" goto choSetup
if "%op%"=="2" goto choInvitePass
if "%op%"=="3" goto choOffer
if "%op%"=="4" goto choExit
echo Please Chose an Option:
goto Start1

:choSetup
cls
ECHO Please Read Carefully:
ECHO Enable "Allow Remote Assitance To This Computer"
ECHO Enable "Allow Connections From Computers Running Any Version Of Remote Desktop" 
ECHO -
ECHO The Window Will Open Shortly, Close It When You Are Finished Please.
ECHO -
PING 1.1.1.1 -n 1 -w 5000 >NUL
SystemPropertiesRemote.exe
ECHO You Have Closed The Window, Returning To Selection Screen
PING 1.1.1.1 -n 1 -w 1500 >NUL
goto start

:choInvitePass
cls
ECHO Please Chose A Password Atleast 6 Characters Long
set /p pass=Chose a Password: 
cls

ECHO Please Send The File To Your Administrator For Assistance
ECHO -
ECHO Please Wait About 10 Seconds For The File To Be Created
ECHO It Will Be On Your Desktop
ECHO It Will Be Named InvitationForHelp
ECHO You May Be Asked To Replace The File, Please Chose Yes
ECHO -
ECHO When The Client Is Closed, This CMD Prompt Will Ask If You Have Finised
PING 1.1.1.1 -n 1 -w 2000 >NUL
start explorer "%userprofile%\Desktop\"
PING 1.1.1.1 -n 1 -w 5000 >NUL
cls
ECHO When The Client Is Closed, This CMD Prompt Will Ask If You Have Finished
msra /saveasfile %Ins_Dir% %pass%
goto hasDone

:choOffer
cls
ECHO Please Only Use This If You Are An Administrator

set /p ruadmin=Are You An Admin (Y/N): 
if "%ruadmin%"=="Y" goto Admin
if "%ruadmin%"=="N" goto start

:Admin
ECHO Hello Admin
PING 1.1.1.1 -n 1 -w 1200 >NUL
cls
ECHO What Would You Like To Do?
ECHO 1) Expert Mode
ECHO 2) Open Help File On Desktop
ECHO 3) Close Prompt
set /p adchoice=Select An Option: 
if "%adchoice%"=="1" msra /expert
if "%adchoice%"=="2" goto choOpenFile
if "%adchoice%"=="3" goto choExit
if "%adchoice%"=="4" goto start
cls
goto Admin
:choOpenFile
cls
ECHO What Is The Password To The Help File:
rem set /p helppass=:
ECHO Opening MSRA With File From Desktop
PING 1.1.1.1 -n 1 -w 1500 >NUL
cls
ECHO Opening...
msra /openfile %userprofile%\Desktop\InvitationForHelp.msrcincident
cls
ECHO Client Has Been Closed, Returning To Admin Panel
PING 1.1.1.1 -n 1 -w 1000 >NUL
goto Admin

:hasDone
cls
set /p done=Has The Session Finished (Y/N): 
if "done"=="Y" goto choExit
if "done"=="N" goto hasDone

:choExit
cls
ECHO Thank You For Using Hidden Server's MSRA Services
PING 1.1.1.1 -n 1 -w 1500 >NUL