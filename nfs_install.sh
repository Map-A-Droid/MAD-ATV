   mkdir -p /cache/recovery
   touch /cache/recovery/command
   echo '--update_package=/sdcard/NFS-INJECTOR.zip' >> /cache/recovery/command
   echo '--wipe_cache' >> /cache/recovery/command
   reboot recovery
