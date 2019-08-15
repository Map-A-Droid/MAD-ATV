#!/system/bin/sh
# update mad
#
# install:
# su
# mount -o rw,remount /system
# cp /<SCRIPTPATH>/update_mad.sh /system/bin/update_mad
# chmod 555 /system/bin/<script_name>
# mount -o ro,remount /system
#
# just run: /usr/bin/adb -s <DEVICEIP>:5555 shell su -c "update_mad"

#delete old apk
echo "Delete old APK"
/system/bin/rm -f /sdcard/Download/RemoteGpsController.apk
/system/bin/rm -f /sdcard/Download/PogoDroid.apk
/system/bin/rm -f /sdcard/Download/pogo.apk

#download apk
echo "Download APK"
cd /sdcard/Download/
/system/bin/curl -o RemoteGpsController.apk -k -s https://raw.githubusercontent.com/Map-A-Droid/MAD/master/APK/RemoteGpsController.apk
/system/bin/curl -o pogodroid.apk -k -s https://www.maddev.de/apk/PogoDroid.apk
/system/bin/curl -L -o pogo.apk -k -s "$(curl -k -s 'https://m.apkpure.com/pokemon-go/com.nianticlabs.pokemongo/download' | grep 'click here'|awk -F'"' '{print $12}')"

#stop mad
echo "stopping MAD processes"
/system/bin/killall com.mad.pogodroid
/system/bin/am force-stop de.grennith.rgc.remotegpscontroller

#install apk
echo "Install APK"
/system/bin/pm install -r /sdcard/Download/RemoteGpsController.apk
/system/bin/pm install -r /sdcard/Download/PogoDroid.apk
/system/bin/pm install -r /sdcard/Download/pogo.apk
/system/bin/pm clear com.nianticlabs.pokemongo

#reboot device
echo "Rebooting Device"
/system/bin/reboot
