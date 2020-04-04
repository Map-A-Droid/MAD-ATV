<br>FOR THE T95 S1 2gb/16gb only, as far as I know.
<br>BE WARNED, half of these are coming in some weird way that doesnt let them flash any rom that I have found.
<br>If you have one of those, I am sorry to hear it.
<br>The safest way to flash is to use the USB burning tool and leave the boxes checked, because when we uncheck the boxes while using a nonworking box we get a brick. It may give an error once or twice before working, so give it a couple tries before declaring it bad.
<br>If you decide that the MAD rom can not be flashed on your device, you can help if you find ANY rom your device is able to flash.
<br>Otherwise you probably want to trade it back to the vendor
<br>
<br>INSTALLATION:
<br>
<br>After you flashed the rom:
<br> * Put TWRP311.zip which you have from the ROM zip on to a usb disk.
<br> * Let the system fully boot.
<br> * Fill in the setup menu, once the box has internet it will download and install the latest pogodroid and pogo and RGC. You wont see RGC installed until after a reboot.
<br> * Go to Android settings, turn off system root, then go down to about, scroll down and click build until it says you are a developer.
<br> * In Android settings - developer settings - turn on "stay awake" and turn on USB debugging. (this will enable adb over tcp)
<br> * now connect to it using adb, which requires clicking allow in the box. adb shell ls /sdcard and after you see smali.zip has downloaded you can adb reboot recovery. Make sure you have a keyboard plugged in to the box before it enters the recovery.
<br> * This will boot in to the stock recovery. now you need to put your usb disk in the box and select "apply update from EXT" then select usb and choose TWRP311.zip.
<br> * Now TWRP starts. Remove your usb disk, add your usb mouse. (WARNING: The TWRP-screen may potentially trigger seizures for people with photosensitive epilepsy.)
<br> * In TWRP slide to allow system mods, then choose install and select magisk.zip, then add more zips and select smali.zip. Slide to install the zips and then wipe cache/dalvik cache. Reboot the system and select to not install twrp app. let Android load.
<br> * Now go to magisk and double check that you pass safetynet.
<br> * In magisk settings repackage magisk.
<br> * Now go to pokemon go and sign in. You will need to use scrcpy or teamviewer to enter data in to the pokemon go app.
<br> * Configure RGC and Pogodroid (I give them 10 seconds delay to start and I leave pogodroid at 120 seconds before injection.
<br>
<br>You will need to use scrcpy or something similar (teamviewer or whatever?) in order to interact with pokemon go. To use scrcpy in portrait mode, be sure you use the adb.exe which is in the scrcpy dir, and then start scrcpy from cmd via scrcpy.exe -b2M -m1024 (many people have sent many suggestions for settings for this command, feel free to set bitrate and res to whatever makes you happy :) )
