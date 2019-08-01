A new feature in RC5 is the ability to autoconfig your RGC and Pogodroid.

In order to use this, you will need to grab your config files from a system which is already running correctly. So you setup your first device by hand, and then run the following commands on that running system:
```
mkdir /sdcard/mad
cp /data/data/com.mad.pogodroid/shared_prefs/com.mad.pogodroid_preferences.xml /sdcard/mad/
cp /data/data/de.grennith.rgc.remotegpscontroller/shared_prefs/de.grennith.rgc.remotegpscontroller_preferences.xml /sdcard/mad/
```
then you will have a directory /sdcard/mad which you need to move to your USB stick.
if you wish to also configure your origin then you can put madorigin.txt in that same directory and in that file just put the origin for the device you are going to autoconfigure.
<b>madorigin.txt must not have windows CRLF file endings</b>
