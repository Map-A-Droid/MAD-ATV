#!/system/bin/sh

## add init.d support
export PATH=${PATH}:/system/bin:/system/xbin

mount -o remount,rw -t auto /system
chmod 755 /system/etc/init.d/*

## init.d execution hook
if grep -rq initdebug /system/etc/init.d/ ;then
    mkdir -p /data/local/madromlogs/
    for file in /system/etc/init.d/* ;do
        sh -x "$file" 2>"/data/local/madromlogs/$(basename "$file").log"
    done
else
    logwrapper busybox run-parts /system/etc/init.d/
fi
