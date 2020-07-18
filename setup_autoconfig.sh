#!/system/bin/sh
usbstick="$(find /mnt/media_rw -maxdepth 1|grep -vE "^/mnt/media_rw$")"
pdconf="/data/data/com.mad.pogodroid/shared_prefs/com.mad.pogodroid_preferences.xml"
rgcconf="/data/data/de.grennith.rgc.remotegpscontroller/shared_prefs/de.grennith.rgc.remotegpscontroller_preferences.xml"
! [[ "$usbstick" ]] && echo "usb not detected" && exit 2
[[ $(wc -l <<< "$usbstick") != "1" ]] && echo "unable to detect your USB stick" && exit 3
! [[ -s "$pdconf" ]] && echo "you dont have Pogodroid configured" && exit 4
! [[ -s "$rgcconf" ]] && echo "you dont have RGC configured" && exit 5
rm -rf /sdcard/mad_autoconfig/
mkdir -p /sdcard/mad_autoconfig/
cp "$pdconf" /sdcard/mad_autoconfig/
cp "$rgcconf" /sdcard/mad_autoconfig/
cp -R /sdcard/mad_autoconfig "$usbstick"
