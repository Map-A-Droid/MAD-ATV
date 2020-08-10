A new feature in RC5 is the ability to autoconfig your RGC and Pogodroid.

In order to use this, you will need to grab your config files from a system which is already running correctly. So you setup your first device by hand. Then you connect to the working box via adb shell:
```
adb connect IPADDRESS_OF_DEVICE
adb shell
su
```
Now you are in a root shell on a running ATV box. Plugin your USB stick and run the following commands:
```
curl -L -o /sdcard/setup_autoconfig.sh -s -k https://raw.githubusercontent.com/Map-A-Droid/MAD-ATV/master/setup_autoconfig.sh
sh /sdcard/setup_autoconfig.sh
```
It will create the folder /sdcard/mad_autoconfig/ on your usb stick with the xml config files inside

If you want to do it manually, follow these steps:
```
mkdir /sdcard/mad
cp /data/data/com.mad.pogodroid/shared_prefs/com.mad.pogodroid_preferences.xml /sdcard/mad/
cp /data/data/de.grennith.rgc.remotegpscontroller/shared_prefs/de.grennith.rgc.remotegpscontroller_preferences.xml /sdcard/mad/
```
Then you will have a directory /sdcard/mad with two XML files. Move them to the root or any other folder of your USB stick.


If you wish to also configure your origin, then you can put madorigin.txt on that stick and in that file just put the origin for the device you are going to autoconfigure.
<b>madorigin.txt must not have windows CRLF file endings</b>
