# WakePS3
A script to power on your PS3 remotely over Bluetooth directly from a games folder that executes .sh-scripts inside RetroPie/Emulationstation, or from a Linux command line.

The script was initially inspired by this Gist from [Nom-DePlume](https://gist.github.com/Nom-DePlume/a2a5433d0913107c1526a0b61b501792). But having an always-on Raspberry Pi server, and with some help from [Gimx' Command line wiki](https://gimx.fr/wiki/index.php?title=Command_line), it was faster and more convenient ssh to and to run a script from it, than to spin up a Linux VM from inside Windows.

Works on most Cambridge Silicon USB BT devices and most built-in Raspberry Pi BT chips. Check chip details with shell command "hciconfig hci0 version" and the [device compatibility list](https://gimx.fr/wiki/index.php?title=Bluetooth_dongle).

Feel free to copy, modify and use as you want. The script does what it's supposed to on my home system and won't be supported, updated or actively maintained.

# Prerequisites
- Raspberry Pi with Linux (but should work on most Linux distros, as well)
- [Gimx](https://github.com/matlo/GIMX/releases/) for Linux or [Raspberry Pi](https://gimx.fr/wiki/index.php?title=RPi), with sixaddr and bdaddr included
- The [PS3_CallOfDutyBlackOps.xml](https://github.com/matlo/GIMX-configurations/blob/master/Windows/PS3_CallOfDutyBlackOps.xml) config file in the ~/.gimx/config folder to run the script
<br>(Or any other xml config file, to be able to run it, but then you have to change the script, as well. It doesn't matter, as the script is terminated after 2 seconds and the PS3 hopefully is powered on...)
- RetroPie/Emulationstation with [Steam or other games menu folders that execute .sh-scripts](#Example-of-sh-script-games-menu-in-Emulationstation)

# Features
- Automatically and remotely power on your PS3 remotely over Bluetooth.
- Can be run directly from the RetroPie Moonlight/Steam games list or from a Linux command line

# Usage

1 - Download and copy the script into your RetroPie Moonlight/Steam roms folder, typically "/home/pi/RetroPie/roms/moonlight". Make sure it's executable. <br>
    Alternatively, in your desired folder, run:<BR>
    ```git clone https://github.com/Vegz78/WakePS3 && sudo chmod +x ./WakePS3/_WakePS3.sh```

2 - Edit _WakePS3.sh with the global variables' 2 OR 3 needed BT device addresses

3 - Start RetroPie and navigate to the Moonlight/Steam games list menu.

4 - Run the _WakePS3 entry.

# Example of sh script games menu in Emulationstation
Edit the file /etc/emulationstation/es_systems.cfg as loosely inspired by [TechWizTime](https://github.com/TechWizTime/moonlight-retropie).

Add something like this:
```
  <system>
    <name>Steam</name>
    <fullname>Steam</fullname>
    <path>/home/pi/RetroPie/roms/moonlight_Berry</path>
    <extension>.sh .SH</extension>
    <command>%ROM%</command>
    <platform>steam</platform>
    <theme>steam</theme>
  </system>
```
