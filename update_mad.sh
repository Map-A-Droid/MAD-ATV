#!/system/bin/sh
# update mad
# version 2.9
# created by GhostTalker, hijaked by krz
#
# adb connect %1:5555
# adb -s %1:5555 push update_mad.sh sdcard
# adb -s %1:5555 shell su -c "mount -o rw,remount /system"
# adb -s %1:5555 shell su -c "cp /sdcard/update_mad.sh /system/bin/update_mad.sh"
# adb -s %1:5555 shell su -c "chmod 555 /system/bin/update_mad.sh"
# adb -s %1:5555 shell su -c "mount -o ro,remount /system"

pdconf="/data/data/com.mad.pogodroid/shared_prefs/com.mad.pogodroid_preferences.xml"

reboot_device(){
if [[ "$USER" == "shell" ]] ;then
 echo "Rebooting Device"
 /system/bin/reboot
fi
}

update_pogodroid(){
echo "updating PogoDroid..."
echo "Delete old APK PogoDroid"
/system/bin/rm -f /sdcard/Download/PogoDroid.apk
echo "Download APK PogoDroid"
cd /sdcard/Download/
/system/bin/curl -L -o PogoDroid.apk -k -s https://www.maddev.de/apk/PogoDroid.apk
echo "Install APK PogoDroid"
/system/bin/pm install -r /sdcard/Download/PogoDroid.apk
}

update_rgc(){
echo "updating RGC..."
echo "Delete old APK RGC"
/system/bin/rm -f /sdcard/Download/RemoteGpsController.apk
echo "Download APK RGC"
cd /sdcard/Download/
/system/bin/curl -L -o RemoteGpsController.apk -k -s https://raw.githubusercontent.com/Map-A-Droid/MAD/master/APK/RemoteGpsController.apk
echo "Install APK RGC"
/system/bin/pm install -r /sdcard/Download/RemoteGpsController.apk
}

get_pd_user(){
user=$(awk -F'>' '/auth_username/{print $2}' "$pdconf"|awk -F'<' '{print $1}')
pass=$(awk -F'>' '/auth_password/{print $2}' "$pdconf"|awk -F'<' '{print $1}')
if [[ "$user" ]] ;then
 printf "-u $user:$pass"
fi
}

update_pokemon(){
pserver=$(grep -v raw "$pdconf"|awk -F'>' '/post_destination/{print $2}'|awk -F'<' '{print $1}')
origin=$(awk -F'>' '/post_origin/{print $2}' "$pdconf"|awk -F'<' '{print $1}')
newver="$(curl -s -L $(get_pd_user) -H "origin: $origin" "$pserver/mad_apk/pogo/armeabi-v7a")"
installedver="$(dumpsys package com.nianticlabs.pokemongo|awk -F'=' '/versionName/{print $2}')"
[[ "$newver" == "$installedver" ]] && unset UpdatePoGo && echo "The madmin wizard has version $newver and so do we, doing nothing." && return 0
[[ "$newver" == "" ]] && unset UpdatePoGo && echo "The madmin wizard has no pogo in its system apks, or your pogodroid is not configured" && return 1
echo "updating PokemonGo..."
mkdir -p /sdcard/Download/pogo
/system/bin/rm -f /sdcard/Download/pogo/*
echo "Download APK PokemonGo"
(cd /sdcard/Download/pogo
until curl -o /sdcard/Download/pogo/pogo.zip -s -k -L $(get_pd_user) -H "origin: $origin" "$pserver/mad_apk/pogo/armeabi-v7a/download" && unzip pogo.zip && rm pogo.zip ;do
 /system/bin/rm -f /sdcard/Download/pogo/*
 sleep 2
done
echo "Install APK PokemonGo"
session=$(pm install-create -r | cut -d [ -f2 | cut -d ] -f1)
for a in * ;do
 pm install-write -S $(stat -c %s $a) $session $a $a
done
pm install-commit $session
)
}

update_init(){
echo "updating init scripts..."
/system/bin/curl -o /etc/init.d/16mad -k -s https://raw.githubusercontent.com/Map-A-Droid/MAD-ATV/master/16mad && chmod +x /etc/init.d/16mad
}

update_dhcp(){
grep -q net.hostname /system/build.prop && unset UpdateDHCP && return 1
origin="$(awk -F'>' '/post_origin/{print $2}' /data/data/com.mad.pogodroid/shared_prefs/com.mad.pogodroid_preferences.xml|cut -d'<' -f1)"
if grep -q 'net.hostname' /system/build.prop ;then
 sed -i -e "s/^net.hostname=.*/net.hostname=${origin}/g" /system/build.prop 
else
 echo "net.hostname=${origin}" >> /system/build.prop
fi
}

print_help(){
cat << EOF
just run: /usr/bin/adb -s <DEVICEIP>:5555 shell su -c "update_mad.sh <options>"

Options:
          -r   (Update RemoteGPSController)
          -p   (Update PokemonGO)
          -d   (Update PogoDroid)
          -n   (update name in DHCP)
          -i   (Update MAD ROM init script)
          -a   (Update all)
          -c   (ClearCache of PokemonGo)
EOF
}

for i in "$@" ;do
 case "$i" in
 -r) UpdateRGC=1 ;;
 -p) UpdatePoGo=1 ;;
 -d) UpdatePogoDroid=1 ;;
 -n) UpdateDHCP=1 ;;
 -a) UpdateRGC=1 UpdatePoGo=1 UpdatePogoDroid=1 UpdateInit=1 ;;
 -c) ClearCache=1 ;;
 -i) UpdateInit=1 ;;
  *) print_help ; exit 1 ;;
 esac
done

(($UpdateRGC))       && update_rgc
(($UpdatePogoDroid)) && update_pogodroid
(($UpdateDHCP))      && update_dhcp
(($UpdatePoGo))      && update_pokemon
(($ClearCache)) && echo "clearing cache of app pokemongo" && /system/bin/pm clear com.nianticlabs.pokemongo
(($UpdateInit))      && update_init
((($UpdateRGC)) || (($UpdateInit)) || (($UpdateDHCP)) || (($UpdatePogoDroid)) || (($UpdatePoGo))) && reboot_device

exit
