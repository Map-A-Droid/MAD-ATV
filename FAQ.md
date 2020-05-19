# FAQ
<br>

## Question #1) <br> After I Flash the rom and it installs the apps and then reboots itself, it does not boot to the recovery. Can you help?<br>

* Answer: There are 2 known answers to this:<br>Some users reported their television could not display twrp, and switching to a monitor fixed it for them.<br><br>Other users needed to find a different recovery that works on their box. Here is a specific example:
<br>[This recovery](https://github.com/Map-A-Droid/MAD-ATV/raw/master/recovery_rare_x96.img) was needed by 2 x96 mini users. They installed the MAD rom and then when it rebooted to recovery nothing loaded. They also could not load the recovery manually by pressing the button inside the AV port while giving it power. This recovery worked for both of them. To use it, format a sd card with fat16 or fat32 and put this file on it named recovery.img and then insert the card into the box without power. While pressing the reset button plug in the power cable and hold down the reset button until the recovery loads. Then continue with Magisk installation.

## Question #2) <br> Why does my box consistently crash after a little while?
* Answer: Probably because of the bad QA which allows these android boxes to be so cheap. Consider swapping boxxes with your vendor. If they were to check their work when putting these together, we would not be paying $30 for a box.<br>Check that your box has 2gb of working ram (some have dead chips). `adb shell "grep MemTotal /proc/meminfo"`<br>Also be sure you are giving the system enough time to finish booting before having RGC/pogodroid start. I have been using 12 seconds, some people use higher numbers, and that is fine.<br>Interesting anecdote: My x96mini was crashing constantly after starting pogo, but I was developing the MAD rom for it so I kept flashing it over and over and testing it. Eventually it stopped crashing and now it is a stable box. I can not explain this. Maybe a chip was alllmost connected and i heated it up enough to connect it better...

## Question #3) <br> Can't login and "account action required" notification on GSuite account.
* Answer: GSuite does not support device management of Android TV. Turn off Mobile Device Management at GSuite Console or use google account.

## Question #4) <br> After flashing rom I have the newest version of Pokemon Go that is not support yet by MAD.
* Answer: First of all, this is extremely unlikely. MAD is usually updated within minutes of the apk being available. I'm calling your bluff on this question. It did not happen. Anyways, if you want to control the installed version just download the version you desire and install it via ADB:
<br> `adb install -r pathtoapk/game.apk` for upgrading
<br> `adb install -d pathtoapk/game.apk` for downgrading

## Question #5) <br> After successfully flashing the box only goes to the MAD splash screen - I've checked that I have the right ROM.
* Answer: There's a possibility that it came with the wrong motherboard, so check the markings on-board. There's been multiple instances of this happening since there's no QA on these.
  * For example, when purchasing a S905X, you might get a S905W, even when the outer casing is what you bought.

## Question #6) <br> Not Flashable X96 Mini Version
* There is one new version of X96 mini that you can not flash. Please don't try to flash over USB, you will brick your device. To identify the wrong version, you will have a look into it. The Board Version is Q9M V1.8 2D    18 11 21, with the Flash Chip: PFF62 - IOAL 1840.
* A known working board version is Q6X v2.3 18186.  Kindly ask the seller to verify prior to purchasing.

## Question #7) <br> `adb shell` gives `Access Denied`
*If you get `Access Denied` from the `su` command, you have to go into Magisk (in the UI) and allow root for `Shell`, then you should be able to `su` and succeed.

## Question #8) <br> How do I maintain my ATV / What are my powering options?
See [madBeavis/PimpMyAtv](https://github.com/madBeavis/PimpMyAtv/) for helpful tips and more information.

## Question #9) <br> GPS signal not found
If you got `GPS signal not found` on a brand new MAD-ROM install (and RGC is running) there is a chance that you *disabled* Location while connecting your Google Account. Go to Android Settings and make sure that [***Location*** is *ON* and set to *Device Only*](https://i.imgur.com/RxEbdRQ.png).
If this is still not working then make sure that you have ***RemoteGpsController*** set in Android Developer options in *Select mock location app* and you installed *Smali Patcher* - it should show up in *Magisk Manager* -> *Modules* - if not go back to *TWRP* and install *smali.zip*

## Question #10) <br> How does the auto-update system work in MAD-ATV?
* Answer: As of mad rom version 1.2.7 when your atv boots it will check through your pogodroid endpoint to see if you have updated install files for pogodroid, RGC, and/or pokemon go in your madmin wizard. To update the files in your madmin wizard go to madmin and click "system" - "madmin apks" and then click the wizard hat. Once those files are updated in madmin they will be installed on your ATV after its next reboot. <br>
To disable autoupdates for pokemon go you can `touch /sdcard/disableautopogoupdate` <br>
To disable autoupdates for pogodroid you can `touch /sdcard/disableautopogodroidupdate` <br>
To disable autoupdates for rgc go you can `touch /sdcard/disableautorgcupdate` <br>
See the [madfiles README](https://github.com/Map-A-Droid/MAD-ATV/blob/master/README_madfiles.md) for more info.

## Question #11) <br> Why does the rom update job always show result: failed / faulty?
* Answer: This was my fault with the old job files using jobtype passthrough instead of jobtype reboot. Just update and it should report success. The other possibility is if you have a REALLY old version like rc2 or something, you might not have the curl binary. This would result in a real error, and not just a faulty / no response.

## Question #12) <br> How do I use MAD-ATV madmin jobs?
* Answer: Just place the files in [personal_commands](https://github.com/Map-A-Droid/MAD-ATV/tree/master/personal_commands) into your MAD/personal_commands/ on your mad server. Then go to madmin, jobs, reload existing jobs. Now you can run any of the jobs such as show rom version, update rom, etc.

## Question #13) <br> Should I use a usb-a cable or sdcard to flash the rom?
You should use a usb-a cable. You want a short cable, and it needs to support data. I paid about $5 on amazon for mine and it works well. You can try the sdcard method, and it will work until it doesnt. If something goes wrong (problem flashing, wrong board, etc) you will probably not be able to try again without the USB method.
