#!/bin/bash

#################################################################################################
# Script to power on your PS3 remotely over Bluetooth.                              		#
#											      	#
# Masks your local BT device temporarily as a PS3 controller already paired with your PS3.	#
# To obtain the BT device address of your PS3 controller and PS3, respectively, see:		#
# https://gimx.fr/wiki/index.php?title=Command_line					    	#
#												#
# Works on most Cambridge Silicon USB BT devices and most built-in Raspberry Pi BT chips.	#
# Check chip details with shell command "hciconfig hci0 version" and device compatibility list	#
# at e.g: https://gimx.fr/wiki/index.php?title=Bluetooth_dongle					#
#												#
# Requires gimx with bdaddr installed, see: https://gimx.fr/wiki/index.php?title=RPi		#
#												#
# Other ways to remotely power on your PS3 remotely, is to activate Remote Start via the 	#
# Remote Play settings on the PS3 and use Wake-On-Lan. But this will keep the fan spinning	#
# and a higher power consumption when the PS3 is in standby/off:				#
# https://manuals.playstation.net/document/en/ps3/current/settings/remotestart.html		#
#												#
#################################################################################################


# Global variables
PS3_ADDR="00:A1:B2:C3:D4:E5"  #Bluetooth device address of your PS3
CTRL_ADDR="01:A1:B2:C3:D4:E5" #BT address of a PS3 controller already paired to the PS3
BT_ADDR=$(hciconfig hci0 | grep Address | cut -d " " -f3)  #Automatically get address of local BT device, or
# Alternatively set it yourself:
# BT_ADDR="02:A1:B2:C3:D4:E5"	#Original BT address of your BT device, from "hciconfig hci0 version"

sudo bdaddr -i hci0 -r $CTRL_ADDR
sleep 2
gimx --nograb --type Sixaxis --config PS3_CallOfDutyBlackOps.xml --bdaddr $PS3_ADDR &>/dev/null &
sleep 2
sudo killall gimx
sudo bdaddr -i hci0 -r $BT_ADDR
