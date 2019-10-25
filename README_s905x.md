For the R95S 2gb/16gb (s905x)
<br>(and probably some other s905x boxes)
<br>
<br>INSTALLATION:
<br>
<br> After you flashed the rom:
<br> * Let the system fully boot.
<br> * Fill in the setup menu fast if you can, once the box has internet it will download and install the latest pogodroid, pogod and RGC.
<br> * After it finishes this it will boot in to TWRP. (WARNING: The TWRP-screen may potentially trigger seizures for people with photosensitive epilepsy.)
<br> * In TWRP slide to allow system mods, then choose install and select Magisk-v18.1.zip, then add more zips and select smali.zip
<br> * slide to Install the zips and then wipe cache/dalvik cache. Reboot the system and let Android load.
<br> * Go to Android settings, about, scroll down and click build until it says you are a developer. Then go to Android settings - developer settings - turn on "stay awake"
<br> * Now go to magisk and double check that you pass safetynet. if not, try a reboot, it's probably just a hiccup, reboot and check again.
<br> * In magisk settings repackage magisk.
<br> * Now go to pokemon go and sign in. You will need to use scrcpy or teamviewer to enter data in to the pokemon go app.
<br> *Configure RGC and Pogodroid (I give them 10 seconds delay to start and I leave pogodroid at 120 seconds before injection.

You will need to use scrcpy or something similar (teamviewer or whatever?) in order to interact with pokemon go. To use scrcpy in portrait mode, be sure you use the adb.exe which is in the scrcpy dir, and then start scrcpy from cmd via scrcpy.exe -b2M -m1024 (feel free to change bitrate to -b4M or screen size to -m512 or whatever you like) )
