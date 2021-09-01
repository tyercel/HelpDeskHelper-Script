@echo off
# Created By Eirick Luraas
# Sept 2014
# this gathers information on the user's Endpoint 
# need to map a drive then use the copy stuff
# mkdir c:\helpdeskinfo
# Xcopy /I \\SHaredfolederto store output\HelpDeskHelper\ c:\helpdeskinfo
cls
set /p problem= Please State the Nature of your Computer Emergency. 
Echo.
ECHO Gathering information about your machine.  Please Wait... 
Echo.
netsh trace start
# rm -rf c:\HelpDeskHelper\%username%
mkdir c:\HelpDeskHelper\%username%
ipconfig /all>>c:\HelpDeskHelper\%username%\ipconfig_%Computername%.log
ping google.com>>c:\HelpDeskHelper\%username%\ping_%Computername%.log
#tracert IP of PowerchartServer>>c:\HelpDeskHelper\%username%\traceroutePowerChart_%Computername%.log
#tracert IP of PowerchartServer2>>c:\HelpDeskHelper\%username%\traceroutePowerChart_%Computername%.log
#tracert IP of PowerchartServer3>>c:\HelpDeskHelper\%username%\traceroutePowerChart_%Computername%.log
#tracert IP of PowerchartServer3>>c:\HelpDeskHelper\%username%\traceroutePowerChart_%Computername%.log
#tracert IP of other Server>>c:\HelpDeskHelper\%username%\tracerouteIDX_%Computername%.log
#tracert IP of other Server>>c:\HelpDeskHelper\%username%\tracerouteIDX_%Computername%.log
#tracert IP of other Server>>c:\HelpDeskHelper\%username%\tracerouteIDX_%Computername%.log
#tracert IP of other Server>>c:\HelpDeskHelper\%username%\tracerouteIDX_%Computername%.log
#tracert IP of other Server>>c:\HelpDeskHelper\%username%\tracerouteIDX_%Computername%.log
systeminfo>>c:\HelpDeskHelper\%username%\SystemInfo_%Computername%.log
dir /b %windir%\Microsoft.NET\Framework\v*>>c:\HelpDeskHelper\%username%\DOTnet_%Computername%.log
set comp>>c:\HelpDeskHelper\%username%\info_%Computername%.log
set VDI>>c:\HelpDeskHelper\%username%\info_%Computername%.log
set user>>c:\HelpDeskHelper\%username%\info_%Computername%.log
echo *>>c:\HelpDeskHelper\%username%\info_%Computername%.log
echo *>>c:\HelpDeskHelper\%username%\info_%Computername%.log
set >>c:\HelpDeskHelper\%username%\info_%Computername%.log
erase c:\HelpDeskHelper\%username%\System_%Computername%.evtx
wevtutil epl System c:\HelpDeskHelper\%username%\System_%Computername%.evtx
erase c:\HelpDeskHelper\%username%\Application_%Computername%.evtx
wevtutil epl Application c:\HelpDeskHelper\%username%\Application_%Computername%.evtx
wmic product get /format:csv > c:\HelpDeskHelper\%username%\Software_%Computername%.csv
cd  C:\Windows\System32\Printing_Admin_Scripts\en-US
CScript //H:CScript
PRNMNGR -l >> c:\HelpDeskHelper\%username%\Printers_%Computername%.txt
netsh trace stop
copy netsh c:\HelpDeskHelper\%username%\info_%Computername%.log
ECHO %problem%>>c:\HelpDeskHelper\%username%\Problem_%Computername%.log
Echo.
ECHO Thank you for your patience.
Echo.
Exit



