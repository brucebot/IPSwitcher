@echo off
echo Choose:
echo [A] Set Static IP
echo [B] Set DHCP
echo.
:choice
SET /P C=[A,B]?
for %%? in (A) do if /I "%C%"=="%%?" goto A
for %%? in (B) do if /I "%C%"=="%%?" goto B
goto choice
:A
@echo off
echo "Please enter Static IP Address Information"
echo "Static IP Address:"
set /p IP_Addr=
 
echo "Subnet Mask:if mask is 255.255.255.0 press enter, if not input here："
set /p Sub_Mask=
if [%Sub_Mask%]==[] (
set Sub_Mask=255.255.255.0
)
 
echo "Default Gateway:"
set /p D_Gate=
 
 
echo "Setting Static IP Information"
netsh interface ipv4  set address "LAN-Verbindung" static %IP_Addr% %Sub_Mask% %D_Gate% 1
netsh int ipv4  show config
pause
goto end
 
:B
@ECHO OFF
ECHO Resetting IP Address and Subnet Mask For DHCP
netsh interface ipv4  set address "LAN-Verbindung" dhcp
 
ipconfig /renew
 
ECHO Here are the new settings for %computername%:
netsh int ipv4  show config
 
pause
goto end
:end