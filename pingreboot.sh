#!/system/bin/sh
#version 2.0

[ -f /sdcard/pingreboot ] || exit

log -t ProtoWifi "pingreboot: started"

# These values can be overridden by putting them
# in $CONF_FILE with a custom value.
# Simply copy & paste lines you want to change.
#
PING_HOST=1.1.1.1
RUN_EVERY=30
REENABLE_EVERY=1
REBOOT_AFTER=10

source /sdcard/pingreboot

c=0
while true; do
  if ping -c 1 "$PING_HOST" > /dev/null; then
    c=0
  else
    c=$((c+1))
    log -t ProtoWifi "pingreboot: network failure, could not ping $PING_HOST"
    if (( $c > $REBOOT_AFTER )); then
       reboot
    elif (( $c % $REENABLE_EVERY == 0 )); then
      log -t ProtoWifi "pingreboot: re-enabling WiFi"
      svc wifi disable
      sleep 4
      svc wifi enable
    fi
  fi
  sleep $RUN_EVERY
done
