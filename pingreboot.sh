#!/system/bin/sh

[[ -f /sdcard/pingreboot ]] || exit
c=0

while :; do
if ping -c 1 1.1.1.1 > /dev/null
then
  c=0
else
  log -t ProtoWifi "network failure"
  svc wifi disable
  sleep 4
  svc wifi enable
  c=$((c+1))
  (( $c > 10 )) && reboot
fi
sleep 30
done
