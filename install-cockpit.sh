#!/bin/bash

echo "--------------------------------------------------"
echo "-- Complete Cockpit installation by @jjahanzebb --"
echo "--------------------------------------------------"

/bin/sudo su <<HERE

echo "[!] checking network interfaces and their states..."
sleep 2
/bin/nmcli d
echo "[?] If your connection is not Connected, Go into Activate a Connection and press Enter on connection name else Quit by pressing ESC"
sleep 15

echo "[!] opening TUI view to set network state..."
sleep 2
/bin/nmtui

echo "[!] DNF package installation will begin shortly.. press y and Enter throughout the rest of the process"
sleep 5
/bin/yum install dnf

echo "[!] cockpit web interface installation will begin shortly.."
sleep 2
/bin/dnf install cockpit

echo "[!] creating socket for cockpit.."
sleep 2
/bin/systemctl enable --now cockpit.socket

echo "[!] adding cockpit service in firewall.."
sleep 2
/bin/firewall-cmd --add-service=cockpit --permanent

echo "[!] reloading firewall.."
sleep 2
/bin/firewall-cmd --reload

echo "[!] installing extra needed features of cockpit.. machines & dashboard"
sleep 2
/bin/dnf install cockpit-machines

/bin/dnf install cockpit-dashboard

echo "[!] opening cockpit web view on default browser.."
/bin/gio open https://localhost:9090

echo "--------------------------------------------------"
echo "--    Installation completed successfully!      --"
echo "--            Press Enter to exit..             --"
echo "--------------------------------------------------"
echo "--          by github.com/jjahanzebb            --"
echo "--------------------------------------------------"

HERE
