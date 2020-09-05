Use the file with w in its name for the X96 mini 2gb/16gb (s905w) and the a95x f1 (and probably some other s905w boxes)

Use the file with x in its name for the R95S 2gb/16gb (s905x) (and probably some other s905x boxes)

##INSTALLATION
After you flashed the rom:
* If you want to use [RGC/pogodroid autoconfig](https://github.com/Map-A-Droid/MAD-ATV/blob/master/README_autoconfig.md) then plug in the configured USB stick.
* Let the system fully boot.
* Fill in the setup menu fast if you can, once the box has internet it will download and install the latest pogodroid and RGC. SAY YES TO ENABLING GPS!!!
* After it finishes this it will boot in to TWRP. TWRP will install magisk and smali for you (as of ROM 1.1.0) and then reboot.
* In magisk settings repackage magisk and optionally enter settings again after and enable auto superuser response = grant.
* Go open RGC and PogoDroid and make sure they are properly configured.
* Now go to Pokemon Go and sign in. You will need to use scrcpy or teamviewer to enter data in to the Pokemon Go app.
* If you did not use RGC/PogoDroid autoconfig then go configure RGC and PogoDroid (I give them 10 seconds delay to start and I leave pogodroid at 120 seconds before injection)

You will need to use scrcpy or something similar (teamviewer or whatever?) in order to interact with Pokemon Go. This ROM comes with adb over tcp enabled. `adb connect <ip>` to connect to it. To use scrcpy in portrait mode, be sure you use the adb.exe which is in the scrcpy dir, and then start scrcpy from cmd via `scrcpy.exe -b2M -m1024` (many people have sent many suggestions for settings for this command, feel free to set bitrate and res to whatever makes you happy :) )

If you have problems getting in to your recovery after the apps install and the box reboots itself, see [FAQ 1](https://github.com/Map-A-Droid/MAD-ATV/blob/master/FAQ.md#question-1--after-i-flash-the-rom-and-it-installs-the-apps-and-then-reboots-itself-it-does-not-boot-to-the-recovery-can-you-help)

After you install the rom you are probably already outdated. Run the upgrade rom madmin job to get up to date. See [FAQ 12](https://github.com/Map-A-Droid/MAD-ATV/blob/master/FAQ.md#question-12--how-do-i-use-mad-atv-madmin-jobs) for more information.
