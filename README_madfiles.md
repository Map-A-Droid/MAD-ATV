The following is a list of files which you can use to change how your MAD ATV behaves.

* **/sdcard/madmac** - Sets the eth0 MAC addy. This happens automatically on your first boot on a95xf1. Can only contain a valid MAC address (some that look valid are not accepted by ifconfig)
* **/sdcard/madmac2** - Sets the wifi MAC addy. Can only contain a valid MAC address (some that look valid are not accepted by ifconfig)
* **/sdcard/pingreboot** - Activates the [pingreboot](https://github.com/Map-A-Droid/MAD-ATV/blob/master/pingreboot.sh) script, which helps if your wifi drops randomly. The script's behavior can also be customized by setting variables in this file like `var=value`:
  * PING_HOST - the host to ping (default: 1.1.1.1)
  * RUN_EVERY - time between pings (default: 30)
  * REENABLE_EVERY - re-enable wifi after this many consecutive failures (default: 1)
  * REBOOT_AFTER - reboot after this many consecutive failures  (default: 10)
* **/sdcard/madversion** - contains the version of mad rom being used
* **/sdcard/disableautopogoupdate** - disables pogo autoupdate
* **/sdcard/disableautopogodroidupdate** - disables pogodroid autoupdate
* **/sdcard/disableautorgcupdate** - disables RGC autoupdate
