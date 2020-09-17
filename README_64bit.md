Auto-Config steps for use with 64-bit ROM:
1) Configure MAD to prepare for auto-configuring devices
2) Flash 64-bit ROM on device
3) Prepare device for auto-config
4) Accept device in MADmin

---

**1) Configure MAD to prepare for auto-configuring devices:**
 - **System -> MADmin Packages -> Click Wizard Hat (Update Everything)**
 - Configure: **Settings -> Auth**
   - with custom user-name and password for basic authentication between device and MAD
 - Configure: **Settings -> Devices**
   - Add and configure new device, not needed if upgrading device from 32-bit to 64-bit
   - May need Apply Settings for new devices to show up in next step
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
 - **System -> Auto-Config** -> click Download Configuration
 - Save mad_autoconf.txt file onto FAT formatted USB drive

---

**2) Flash 64-bit ROM on device:**
 - Get burning tool from links here: https://github.com/Map-A-Droid/MAD-ATV/wiki#flashing-instructions
 - Open burning tool
 - Import correct 64-bit image for device(*1)
 - Click Start
 - Connect device(*2) to computer with USB-A to USB-A cable
 - When burning is 100% done, disconnect the USB cable from the device
   - (connect another device if you are flashing more than one)
 - Click Stop
 - Close burning tool 
   - (*1) - Find ROMs here: https://github.com/Map-A-Droid/MAD-ATV/releases (Currently under the "This is beta!" link)
   - (*2) - On Tx9s, flash with the USB port closest to the network port
     - On x96mini use left USB port (recommended on Discord)
     - On A95xF1 use right USB port (recommended on Discord)

---

**3) Prepare device for auto-config:**
 - *see optional network config steps below (*2)
 - Plug FAT formatted USB drive with mad_autoconf.txt file into appropriate USB port (*1)
 - Plug network cable into device
 - Plug power into device (usb-to-barrel, or power brick-to-barrel)
   - (*1) - On Tx9s, plug USB drive into USB port farthest away from network port

   - (*2) - optional steps to manually configure network on device, ie no DHCP:
     - This option is advanced and is not recommended and is not likely to be supported on Discord
     - Do not plug in the network cable yet!
     - Connect video and keyboard to device (keyboard into non-flash usb port)
     - Connect power to the device
     - Wait for it to boot up and get to the Khadas Welcome screen
     - Press enter (once or twice) to select Got It
     - Use keyboard to enter the App Tray (6 dots in the circle at the bottom)
     - Enter the "Settings" (gear) icon
     - Select the "Network" option
     - Select the "IP settings" option
     - Select the "Static" option
     - Enter manual ip address info
     - Once that is saved, you can press escape to get back to the app tray
     - Disconnect the keyboard and plug the USB drive into that USB port
     - Continue with "3. Prepare device for auto-config"

---

**4) Accept device in MADmin:**
 - You should see your device under **System -> Auto-Config -> Pending Devices**
   - if not, see trouble-shooting steps below
 - Click the IP-address of the pending device, then assign it an origin
   - Do not just click accept, if you do then MAD will create a new origin named madromxyz and assign it to the device
 - Once an origin is assigned the device will start downloading files and configuring its settings
   - You can watch its progress by clicking on the View Device logs on the Pending Devices page

---
---

**Trouble-shooting:**

**1) Problems flashing image onto device:**
 - Make sure you are using a high quality short USB-A to USB-A cable
   * see Cabling under beavis's PimpMyAtv wiki for good options: https://github.com/madBeavis/PimpMyAtv/wiki
 - Try to use a different USB port on the device
 - Try to use a different USB port on the computer
 - Sometimes there are flashing problems with USB3 ports, try to use a USB2 port
 - Sometimes there are flashing problems from computers with an AMD processor,
       try flashing from a computer with an Intel processor
 - Sometimes you need to hold down the reset button to get the flashing process started
   * On A95xF1 the reset button is inside the AV port
   * Usually when it gets to about 3-7% flashing you can stop holding the reset button
 - Sometimes you need to plug in power to the device at the same time you plugin in the USB cable
   * This is usally to correct lowper warnings

---

**2) Device not showing up in MADmin -> System -> Auto-Config -> Pending Devices:**

If at this point it never showed up in madmin and goes direct to flashing things in TWRP,
then you have a problem with it reading the autoconfig file from your USB drive.
You can try using the other USB port, be sure it is fat formatted, no windows line endings,
and double check the file is formatted as described above.

To verify the device can access the USB drive:
 - `adb connect <ip>`
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