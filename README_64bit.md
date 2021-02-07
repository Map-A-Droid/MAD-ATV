How to use Auto-Config with the 64-bit ROMs
1. [Configure MAD to prepare for auto-configuring devices](#configure-mad-to-prepare-for-auto-configuring-devices)
2. [Flash 64-bit ROM on device](#flash-64-bit-rom-on-device)
3. [Prepare device for auto-config](#prepare-device-for-auto-config)
4. [Accept device in MADmin](#accept-device-in-mad)
5. [Troubleshooting](#troubleshooting)

## Configure MAD to prepare for auto-configuring devices
 - **System -> MADmin Packages -> Click Wizard Hat (Update Everything)**
 - Configure: **Settings -> Auth**
   - With custom user-name and password for basic authentication between device and MAD
 - Configure: **Settings -> Devices**
   - Add and configure new device, not needed if upgrading device from 32-bit to 64-bit
   - May need to click **Apply Settings** for new devices to show up in next step
 - Configure: **Settings -> PoGo Auth**
   - Add GMail, or PTC, accounts and passwords
   - Assign to appropriate existing device
 - Configure: **System -> Auto-Config -> PogoDroid Configuration**
   - set Backend User/Password
   - set Post Destination
   - set Basic Authentication
 - Configure: **System -> Auto-Config -> RemoteGPSController Configuration**
   - set Websocket URI
   - set Basic Authentication
 - **Apply Settings!**
 - **System -> Auto-Config**, click **Download Configuration**
   - This file will only have two lines in it:
     - Your PogoDroid *Post Destination*
     - Your basic auth *user:password*
 - Under **System -> Auto-Config -> Pending Devices**
   - You may see a note saying: *No available Google logins for auto creation of devices. Configure through PogoAuth*
   - This is normal since we want to assign a preconfigured device to an auto-config request, and we do not want MAD to auto-create a new device (which would later need to be configured anyway)
 - Save the downloaded mad_autoconf.txt file onto a FAT formatted USB drive

## Flash 64-bit ROM on device
 - Get burning tool from [here](https://github.com/Map-A-Droid/MAD-ATV/wiki#flashing-instructions)
 - Install burning tool
 - Open burning tool (may need to "Run as Administrator")
 - Import correct 64-bit image for device<sup>1</sup>
 - Click Start
 - Press the reset button for the ATV
   - Use something like a wooden toothpick
   - On the A95X F1 and the X96 Mini the reset button is inside the AV port
 - Connect device<sup>2</sup> to computer with a USB-A to USB-A cable
 - Connect power cable to ATV
 - When burning is 100% done, disconnect the USB and power cables from the device
   - (Connect the next device if you are flashing more than one)
 - Click Stop
 - Close burning tool

<sup>1</sup> Find the current beta 64-bit ROMs [here](https://github.com/Map-A-Droid/MAD-ATV/releases/tag/mad64_beta5).

<sup>2</sup> Recommended USB ports for flashing (use other if first doesn't work):
 - On TX9S, flash with the USB port closest to the network port
 - On X96 Mini use USB port farther away from SD-card slot
 - On A95X F1 use USB port closest to power connection

## Prepare device for auto-config
See optional network config [steps](#manual-network-configuration) if you need to set a Static IP on the ATV.

 - Plug FAT32 formatted USB drive with the mad_autoconf.txt file into appropriate USB port
   - On the TX9S use the USB port farthest away from network port
   - On A95X F1 use USB port closest/next to SD-card slot
   - On X96 Mini use USB port closest/next to SD-card slot
 - Plug network cable into the device
 - Plug power into device (usb-to-barrel, or power brick-to-barrel)
 - If the device contacted your MAD server successfully, it will not do anything until you [Accept the device in MAD](#accept-device-in-mad)
   - It may take a minute or two for your device to show up on the **Auto-Config -> Pending Devices** page
 - If your device reboots into TWRP to flash packages and never showed up in MAD, then see [Troubleshooting](#troubleshooting)

### Manual network configuration
Optional steps to manually configure the network interface on device (ie no DHCP).

This option is advanced and is not recommended and is not likely to be supported on Discord.

 - Do not plug in the network cable yet!
 - Connect video and keyboard to device (keyboard into non-flash usb port)
 - Connect power to the device
 - Wait for it to boot up and get to the Khadas Welcome screen
 - Press enter (once or twice) to select "Got It"
 - Use keyboard to enter the App Tray (6 dots in the circle at the bottom)
 - Enter the "Settings" (gear) icon
 - Select the "Network" option
 - Select the "IP settings" option
 - Select the "Static" option
 - Enter manual IP address info
 - Once that is saved, you can press escape to get back to the app tray
 - Disconnect the keyboard and plug the USB drive into the USB port for that device
 - Continue with [Prepare device for auto-config](#prepare-device-for-auto-config)

## Accept device in MAD
 - You should see your device under **System -> Auto-Config -> Pending Devices**
   - If not, see [troubleshooting](#troubleshooting) below
 - Click the IP-address of the pending device, then assign it an origin
   - Do not just click accept, if you do then MAD will create a new origin named madromxyz and assign it to the device
 - Once an origin is assigned the device will start downloading files and configuring its settings
   - You can watch its progress by clicking on the View Session logs on the Pending Devices page

## Troubleshooting

### Problems flashing image onto device
The flashing tool is known to be temperamental. Some steps you can try include:

 - Make sure you are using a high quality short USB-A to USB-A cable
   - See beavis's [PimpMyAtv wiki](https://github.com/madBeavis/PimpMyAtv/wiki/Cabling) for good options
 - Try to use a different USB port on the device
 - Try to use a different USB port on the computer
 - Reboot Windows, those USB drivers are funky
 - Sometimes there are flashing problems with USB3 ports, try to use a USB2 port
 - Sometimes there are flashing problems from computers with an AMD processor, try flashing from a computer with an Intel processor
 - Sometimes you need to plug in power to the device at the same time you plugin in the USB cable
   - This is usually to correct low power warnings

### Device not showing up in MADmin -> System -> Auto-Config -> Pending Devices

If at this point it has never showed up in MADmin, then there are two likely problems.
Either it had a problem reading the autoconfig file from your USB drive and it goes direct to flashing things in TWRP,
or it read the autoconfig file from the USB drive but it has a problem accessing your MAD server due to incorrect settings or network issues.

To find out what errors or problems your device is encountering, or just to see the status of 42mad
configuring your device, you can adb into your device and check the `/data/local/madromlogs/42mad.log` log
file.

To view the log remotely on the device:
 - `adb connect <ip>`
 - `adb shell`
 - `su`
 - `cat /data/local/madromlogs/42mad.log`

Or to bring the file locally (and save it to `/tmp/42mad.log`):
 - `adb connect <ip>`
 - `adb pull /data/local/madromlogs/42mad.log /tmp/42mad.log`

For problems reading the USB drive you can try using the other USB port,
make sure the drive is FAT formatted, and that the mad_autoconf.txt file has no Windows line endings.

To verify the device can access the USB drive:
 - `adb connect <ip>`
 - `adb shell`
 - `su`
 - `ls -la /mnt/media_rw/`
 
If you see only two lines like:
```
drwxr-x---  2 root media_rw  40 1970-01-01 00:00 .
drwxr-xr-x 10 root system   220 1970-01-01 00:00 ..
```

That means the device hasn't recognized the USB drive, try the other USB port on the device.
You should see a result like:
```
drwxr-x---  3 root     media_rw    60 2020-09-17 15:43 .
drwxr-xr-x 10 root     system     220 1970-01-01 00:00 ..
drwxrwx---  4 media_rw media_rw 16384 1970-01-01 00:00 2A58-B057
```

When you see that, this is the port you should plug the USB drive into after flashing and before powering the device up for the first time.
