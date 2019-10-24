A new feature in RC5 is the ability to autoconfig your RGC and Pogodroid.

In order to use this, you will need to grab your config files from a system which is already running correctly. So you setup your first device by hand. Then you connect to the working box via adb shell:
```
adb connect IPADDRESS_OF_DEVICE
adb shell
su
```

If you get `Access Denied` from the `su` command, you have to go into Magisk and allow root for `Shell`, then you should be able to `su` and succeed.

Now you are in a root shell on a running ATV box. Run the following commands:
```
mkdir /sdcard/mad
cp /data/data/com.mad.pogodroid/shared_prefs/com.mad.pogodroid_preferences.xml /sdcard/mad/
cp /data/data/de.grennith.rgc.remotegpscontroller/shared_prefs/de.grennith.rgc.remotegpscontroller_preferences.xml /sdcard/mad/
```
Then you will have the directory `/sdcard/mad` which you need to move the contents of to the root of your USB stick.
If you wish to also configure your origin then you can put `madorigin.txt` in that same directory and in that file just put the origin for the device you are going to autoconfigure.

Generally it is recommended to configure your `madorigin.txt` for each device.

<b>madorigin.txt must not have windows CRLF file endings</b>
