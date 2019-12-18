#!/system/bin/sh
# Install the NFS module
# version 1

! [[ -f /sdcard/NFS-INJECTOR.zip ]] && echo "/sdcard/NFS-INJECTOR.zip does not exist" && exit 1
mkdir -p /cache/recovery
touch /cache/recovery/command
echo '--update_package=/sdcard/NFS-INJECTOR.zip' >> /cache/recovery/command
echo '--wipe_cache' >> /cache/recovery/command
reboot recovery
