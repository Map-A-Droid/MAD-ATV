For the X96 mini 2gb/16gb (s905w) and the a95x f1
<br>(and probably some other s905w boxes)
<br>
<br>INSTALLATION:
<br>
<br>After you flashed the rom:
<br>* Let the system fully boot.
<br>* Fill in the setup menu fast if you can, once the box has internet it will download and install the latest pogodroid and RGC.
<br>* After it finishes this it will boot in to TWRP. (WARNING: The TWRP-screen may potentially trigger seizures for people with photosensitive epilepsy.)
<br>* In TWRP slide to allow system mods, then choose install and select Magisk-v18.1.zip, then add more zips and select smali.zip,then add more zips and select the NFS module zip.
<br>* Install the zips and then wipe cache/dalvik cache.
<br>* Now is the time to plug in your USB stick if you want to use [RGC/pogodroid autoconfig](https://github.com/Map-A-Droid/MAD-ATV/blob/master/README_autoconfig.md) (available since RC5). If you do that when you reboot they should configure themselves from your USB.
<br>* Reboot the system and let Android load. You must not reboot again for at least 5 minutes according to the NFS module docs.
<br>* Go to Android settings, about, scroll down and click build until it says you are a developer. Then go to Android settings - developer settings - turn on "stay awake"
<br>* Now go to magisk and double check that you pass safetynet.
<br>* In magisk settings repackage magisk.
<br>* Go open RGC and Pogodroid and give them the permissions they need.
<br>* Now go to pokemon go and sign in. You will need to use scrcpy or teamviewer to enter data in to the pokemon go app.
<br>* If you did not use RGC/pogodroid autoconfig then go configure RGC and Pogodroid (I give them 10 seconds delay to start and I leave pogodroid at 120 seconds before injection.
<br>
<br>You will need to use scrcpy or something similar (teamviewer or whatever?) in order to interact with pokemon go. This ROM comes with adb over tcp enabled. `adb connect <ip>` to connect to it. To use scrcpy in portrait mode, be sure you use the adb.exe which is in the scrcpy dir, and then start scrcpy from cmd via `scrcpy.exe -b2M -m1024` (many people have sent many suggestions for settings for this command, feel free to set bitrate and res to whatever makes you happy :) )
<br>
<br> If you have problems getting in to your recovery after the apps install and the box reboots itself, see [FAQ 1](https://github.com/Map-A-Droid/MAD-ATV/blob/master/FAQ.md#question-1--after-i-flash-the-rom-and-it-installs-the-apps-and-then-reboots-itself-it-does-not-boot-to-the-recovery-can-you-help)
