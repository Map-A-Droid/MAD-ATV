The following is a list of files which you can use to change how your MAD ATV behaves.

* **/sdcard/madmac** - Sets the eth0 MAC addy. This happens automatically on your first boot on a95xf1. Can only contain a valid MAC address (some that look valid are not accepted by ifconfig)
* **/sdcard/madmac2** - Sets the wifi MAC addy. Can only contain a valid MAC address (some that look valid are not accepted by ifconfig)
* **/sdcard/pingreboot** - activates the pingreboot script, which helps if your wifi drops randomly. see [pingreboot.sh](https://github.com/Map-A-Droid/MAD-ATV/blob/master/pingreboot.sh)
* **/sdcard/madversion** - contains the version of mad rom being used
* **/sdcard/disableautopogoupdate** - disables pogo autoupdate
