#!/system/bin/sh
# update mad
# version 2.0.1
# created by GhostTalker
#

function stop_mad(){
	echo "stopping MAD processes"
	/system/bin/killall com.mad.pogodroid
	/system/bin/am force-stop de.grennith.rgc.remotegpscontroller
	echo ""
}

function reboot_device(){
	echo "Rebooting Device"
	/system/bin/reboot
}

function update_pogodroid(){
	echo "updating PogoDroid..."
	echo "Delete old APK PogoDroid"
	/system/bin/rm -f /sdcard/Download/PogoDroid.apk
	echo "Download APK PogoDroid"
	cd /sdcard/Download/
	/system/bin/curl -o PogoDroid.apk -k -s https://www.maddev.de/apk/PogoDroid.apk
	echo "Install APK PogoDroid"
	/system/bin/pm install -r /sdcard/Download/PogoDroid.apk
	echo ""
}

function update_rgc(){
	echo "updating RGC..."
	echo "Delete old APK RGC"
	/system/bin/rm -f /sdcard/Download/RemoteGpsController.apk
	echo "Download APK RGC"
	cd /sdcard/Download/
	/system/bin/curl -o RemoteGpsController.apk -k -s https://raw.githubusercontent.com/Map-A-Droid/MAD/master/APK/RemoteGpsController.apk
	echo "Install APK RGC"
	/system/bin/pm install -r /sdcard/Download/RemoteGpsController.apk
	echo ""
}

function update_pokemon(){
	echo "updating PokemonGo..."
	echo "Delete old APK PokemonGo"
	/system/bin/rm -f /sdcard/Download/pogo.apk
	echo "Download APK PokemonGo"
	cd /sdcard/Download/
        /system/bin/curl -L -o /sdcard/pogo.apk -k -s "$(curl -k -s "https://m.apkpure.com$(curl -k -s "https://m.apkpure.com$(curl -k -s 'https://m.apkpure.com/pokemon-go/com.nianticlabs.pokemongo/versions'|awk -F'"' '/Download Pokémon GO v/{print $4}'|head -n1)"|grep -A10 armeabi-v7a|awk -F'"' '/Download Pokémon GO v/{print $4}'|head -n1)"|awk -F'"' '/click here/{print $12}')"	echo "Install APK PokemonGo"
        echo "Install APK PokemonGo"
        /system/bin/pm install -r /sdcard/Download/pogo.apk
	echo ""
}

function print_help(){
	echo "install:"
	echo "su"
	echo "mount -o rw,remount /system"
	echo "cp /<SCRIPTPATH>/update_mad.sh /system/bin/update_mad"
	echo "chmod 555 /system/bin/update_mad"
	echo "mount -o ro,remount /system"
	echo ""
	echo "just run: /usr/bin/adb -s <DEVICEIP>:5555 shell su -c \"update_mad <options>\""
	echo ""
	echo "Options:"
	echo "          -r   (Update RemoteGPSController)"
	echo "          -p   (Update PokemonGO)"
	echo "          -d   (Update PogoDroid)"
	echo "          -a   (Update all)"
	echo "          -c   (ClearCache of PokemonGo)"
}


for i in "$@"
do
	case  $i  in
		-r)
			UpdateRGC=1
			;;
		-p)
			UpdatePoGo=1
			;;
		-d)
			UpdatePogoDroid=1
			;;
		-a)
			UpdateRGC=1
			UpdatePoGo=1
			UpdatePogoDroid=1
			;;
		-c)
			ClearCache=1
			;;
		*)
			print_help
			exit
			;;
	esac
done

((($UpdateRGC)) || (($UpdatePogoDroid)) || (($UpdatePoGo))) && stop_mad
(($UpdateRGC))       && update_rgc
(($UpdatePogoDroid)) && update_pogodroid
(($UpdatePoGo))      && update_pokemon
(($ClearCache)) && echo "clearing cache of app pokemongo" && /system/bin/pm clear com.nianticlabs.pokemongo
((($UpdateRGC)) || (($UpdatePogoDroid)) || (($UpdatePoGo))) && reboot_device

exit
