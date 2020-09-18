#!/system/bin/sh
# update mad
# version 3.9
# created by GhostTalker, hijaked by krz
#
# adb connect %1:5555
# adb -s %1:5555 push update_mad.sh sdcard
# adb -s %1:5555 shell su -c "mount -o rw,remount /system"
# adb -s %1:5555 shell su -c "cp /sdcard/update_mad.sh /system/bin/update_mad.sh"
# adb -s %1:5555 shell su -c "chmod 555 /system/bin/update_mad.sh"
# adb -s %1:5555 shell su -c "mount -o ro,remount /system"

pdconf="/data/data/com.mad.pogodroid/shared_prefs/com.mad.pogodroid_preferences.xml"

case "$(uname -m)" in
 aarch64) arch="arm64_v8a";;
 armv8l)  arch="armeabi-v7a";;
esac

checkpdconf(){
if ! [[ -s "$pdconf" ]] ;then
 echo "pogodroid not configured yet"
 return 1
fi
}

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
reboot=1
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
reboot=1
}

get_pd_user(){
checkpdconf || return 1
user=$(awk -F'>' '/auth_username/{print $2}' "$pdconf"|awk -F'<' '{print $1}')
pass=$(awk -F'>' '/auth_password/{print $2}' "$pdconf"|awk -F'<' '{print $1}')
if [[ "$user" ]] ;then
 printf "-u $user:$pass"
fi
}

checkupdate(){
# $1 = new version
# $2 = installed version
! [[ "$2" ]] && return 0 # for first installs
i=1
#we start at 1 and go until number of . so we can use our counter as awk position
places=$(awk -F. '{print NF+1}' <<< "$1")
while (( "$i" < "$places" )) ;do
 npos=$(awk -v pos=$i -F. '{print $pos}' <<< "$1")
 ipos=$(awk -v pos=$i -F. '{print $pos}' <<< "$2")
 case "$(( $npos - $ipos ))" in
  -*) return 1 ;;
   0) ;;
   *) return 0 ;;
 esac
 i=$((i+1))
 false
done
}

cast_alohomora(){
#update rgc using the wizard
checkpdconf || return 1
pserver=$(grep -v raw "$pdconf"|awk -F'>' '/post_destination/{print $2}'|awk -F'<' '{print $1}')
! [[ "$pserver" ]] && echo "pogodroid endpoint not configured yet, cannot contact the wizard" && return 1
origin=$(awk -F'>' '/post_origin/{print $2}' "$pdconf"|awk -F'<' '{print $1}')
newver="$(curl -s -k -L $(get_pd_user) -H "origin: $origin" "$pserver/mad_apk/rgc/noarch")"
installedver="$(dumpsys package de.grennith.rgc.remotegpscontroller 2>/dev/null|awk -F'=' '/versionName/{print $2}'|head -n1)"
if checkupdate "$newver" "$installedver" ;then
 echo "updating RGC..."
 rm -f /sdcard/Download/RemoteGpsController.apk
 until curl -o /sdcard/Download/RemoteGpsController.apk  -s -k -L $(get_pd_user) -H "origin: $origin" "$pserver/mad_apk/rgc/download" ;do
  rm -f /sdcard/Download/RemoteGpsController.apk
  sleep
 done
 if [[ "$installedver" ]] ;then
  /system/bin/pm install -r /sdcard/Download/RemoteGpsController.apk
 else
  mv /sdcard/Download/RemoteGpsController.apk /system/priv-app/RemoteGpsController.apk
  /system/bin/chmod 644 /system/priv-app/RemoteGpsController.apk
  /system/bin/chown root:root /system/priv-app/RemoteGpsController.apk
 fi
fi
reboot=1
}

cast_imperius(){
#update pogodroid using the wizard
checkpdconf || return 1
pserver=$(grep -v raw "$pdconf"|awk -F'>' '/post_destination/{print $2}'|awk -F'<' '{print $1}')
! [[ "$pserver" ]] && echo "pogodroid endpoint not configured yet, cannot contact the wizard" && return 1
origin=$(awk -F'>' '/post_origin/{print $2}' "$pdconf"|awk -F'<' '{print $1}')
newver="$(curl -s -k -L $(get_pd_user) -H "origin: $origin" "$pserver/mad_apk/pogodroid/noarch")"
installedver="$(dumpsys package com.mad.pogodroid|awk -F'=' '/versionName/{print $2}'|head -n1)"
if checkupdate "$newver" "$installedver" ;then
 echo "updating pogodroid..."
 rm -f /sdcard/Download/PogoDroid.apk
 until curl -o /sdcard/Download/PogoDroid.apk -s -k -L $(get_pd_user) -H "origin: $origin" "$pserver/mad_apk/pogodroid/download" ;do
  rm -f /sdcard/Download/PogoDroid.apk
  sleep
 done
 /system/bin/pm install -r /sdcard/Download/PogoDroid.apk
fi
reboot=1
}

update_pokemon(){
checkpdconf || return 1
pserver=$(grep -v raw "$pdconf"|awk -F'>' '/post_destination/{print $2}'|awk -F'<' '{print $1}')
! [[ "$pserver" ]] && echo "pogodroid endpoint not configured yet, cannot contact the wizard" && return 1
origin=$(awk -F'>' '/post_origin/{print $2}' "$pdconf"|awk -F'<' '{print $1}')
newver="$(curl -s -k -L $(get_pd_user) -H "origin: $origin" "$pserver/mad_apk/pogo/$arch")"
installedver="$(dumpsys package com.nianticlabs.pokemongo|awk -F'=' '/versionName/{print $2}')"
[[ "$newver" == "" ]] && unset UpdatePoGo && echo "The madmin wizard has no pogo in its system apks, or your pogodroid is not configured" && return 1
[[ "$newver" == "$installedver" ]] && unset UpdatePoGo && echo "The madmin wizard has version $newver and so do we, doing nothing." && return 0
echo "updating PokemonGo..."
mkdir -p /sdcard/Download/pogo
/system/bin/rm -f /sdcard/Download/pogo/*
case "$(curl -I -s -k -L $(get_pd_user) -H "origin: $origin" "$pserver/mad_apk/pogo/$arch/download"|grep -i Content-Type)" in
 *zip*) (cd /sdcard/Download/pogo
       until curl -o /sdcard/Download/pogo/pogo.zip -s -k -L $(get_pd_user) -H "origin: $origin" "$pserver/mad_apk/pogo/$arch/download" && unzip pogo.zip && rm pogo.zip ;do
        echo "Download ZIP PokemonGo"
        /system/bin/rm -f /sdcard/Download/pogo/*
        sleep 2
       done
       echo "Install ZIP PokemonGo"
       session=$(pm install-create -r | cut -d [ -f2 | cut -d ] -f1)
       for a in * ;do
        pm install-write -S $(stat -c %s $a) $session $a $a
       done
       pm install-commit $session )
 ;;
 *vnd.android.package-archive*)
       until curl -o /sdcard/Download/pogo/pogo.apk -s -k -L $(get_pd_user) -H "origin: $origin" "$pserver/mad_apk/pogo/$arch/download" ;do
        echo "Download APK PokemonGo"
        /system/bin/rm -f /sdcard/Download/pogo/*
        sleep 2
       done
       echo "Install APK PokemonGo"
       /system/bin/pm install -r /sdcard/Download/pogo/pogo.apk
 ;;
 *)    echo "unknown format pogo detected from madmin wizard"
       curl -I -s -k -L $(get_pd_user) -H "origin: $origin" "$pserver/mad_apk/pogo/$arch/download"|grep -i Content-Type
       return 1
 ;;
esac
reboot=1
}

update_init(){
echo "updating init scripts..."
if [[ "$arch" == "arm64_v8a" ]] ;then
 /system/bin/curl -o /etc/init.d/42mad -k -s https://raw.githubusercontent.com/Map-A-Droid/MAD-ATV/master/42mad && chmod +x /etc/init.d/42mad
else
 /system/bin/curl -o /etc/init.d/16mad -k -s https://raw.githubusercontent.com/Map-A-Droid/MAD-ATV/master/16mad && chmod +x /etc/init.d/16mad
 reboot=1
fi
}

update_dhcp(){
grep -q net.hostname /system/build.prop && unset UpdateDHCP && return 1
origin="$(awk -F'>' '/post_origin/{print $2}' /data/data/com.mad.pogodroid/shared_prefs/com.mad.pogodroid_preferences.xml|cut -d'<' -f1)"
mount -o remount,rw /system
if grep -q 'net.hostname' /system/build.prop ;then
 sed -i -e "s/^net.hostname=.*/net.hostname=${origin}/g" /system/build.prop
else
 echo "net.hostname=${origin}" >> /system/build.prop
fi
mount -o remount,ro /system
reboot=1
}

print_help(){
cat << EOF
just run: /usr/bin/adb -s <DEVICEIP>:5555 shell su -c "update_mad.sh <options>"

Options:
          -r   (Update RemoteGPSController from web)
          -wr  (Update RemoteGPSController from madmin wizard)
          -d   (Update PogoDroid from web)
          -wd  (Update PogoDroid from madmin wizard)
          -p   (Update PokemonGO)
          -n   (update name in DHCP)
          -i   (Update MAD ROM init script)
          -a   (Update all)
          -wa  (Update all with wizard)
          -c   (ClearCache of PokemonGo)
          -pdc (Use /data/local/pdconf instead of $pdconf)
EOF
}

for i in "$@" ;do
 case "$i" in
 -r) update_rgc ;;
 -wr) cast_alohomora ;;
 -d) update_pogodroid ;;
 -wd) cast_imperius ;;
 -p) update_pokemon ;;
 -n) update_dhcp ;;
 -i) update_init ;;
 -a) update_rgc; update_pokemon; update_pogodroid; update_init ;;
 -wa) cast_alohomora; update_pokemon; cast_imperius; update_init ;;
 -c) echo "clearing cache of app pokemongo" && /system/bin/pm clear com.nianticlabs.pokemongo ;;
 -pdc) pdconf=/data/local/pdconf ;;
  *) print_help ; exit 1 ;;
 esac
done

(( $reboot )) && reboot_device
exit
