#!/system/bin/sh
# Install the NFS module
# version 1.2
#
NFS_url="https://github.com/Map-A-Droid/MAD-ATV/raw/master/nfs/NFS-INJECTOR-v7.8.FLASHPOINT.zip"
useragent="Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3"

download(){
# $1 = url
# $2 = local path
# lets see that curl exits successfully
until /system/bin/curl -s -k -L -A "$useragent" -o "$2" "$1" ;do
 sleep 60
done
}

rm /sdcard/NFS-INJECTOR.zip
download "$NFS_url" /sdcard/NFS-INJECTOR.zip
mkdir -p /cache/recovery
touch /cache/recovery/command
echo '--update_package=/sdcard/NFS-INJECTOR.zip' >> /cache/recovery/command
echo '--wipe_cache' >> /cache/recovery/command
reboot recovery
