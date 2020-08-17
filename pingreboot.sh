#!/system/bin/sh
#version 2.1

lolcat(){
log -t PingReboot $1
}

CONF_FILE=/sdcard/pingreboot
lolcat "checking for $CONF_FILE file"
if [ -f $CONF_FILE ]; then
  lolcat "$CONF_FILE found"
else
  lolcat "$CONF_FILE not existing, not starting PingReboot"
  exit 1
fi
lolcat "starting"

# These values can be overridden by putting them
# in $CONF_FILE with a custom value.
# Simply copy & paste lines you want to change.
#
PING_HOST="google.com"
RUN_EVERY=30
REENABLE_EVERY=1
REBOOT_AFTER=10

INTERFACE=$(ip route get 8.8.8.8 | sed -nr 's/.*dev ([^\ ]+).*/\1/p')
lolcat "identified $INTERFACE as the internet connected interface"
source $CONF_FILE

c=0
lolcat "now entering the eternal loop"
while true; do
  if ping -c 1 "$PING_HOST" > /dev/null; then
    if (( $c > 0 )); then
      lolcat "network connection re-established!"
    fi
    c=0
  else
    c=$((c+1))
    lolcat "network failure, could not ping $PING_HOST (c=$c)"
    if (( $c > $REBOOT_AFTER )); then
       reboot
    elif (( $c % $REENABLE_EVERY == 0 )); then
      lolcat "re-enabling $INTERFACE"
      ifconfig $INTERFACE down
      sleep 4
      ifconfig $INTERFACE up
      lolcat "interface $INTERFACE re-enabled"
    fi
  fi
  sleep $RUN_EVERY
done
