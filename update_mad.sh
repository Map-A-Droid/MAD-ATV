#!/system/bin/sh
# update mad
# version 2.6
# created by GhostTalker
#
# adb connect %1:5555
# adb -s %1:5555 push update_mad.sh sdcard
# adb -s %1:5555 shell su -c "mount -o rw,remount /system"
# adb -s %1:5555 shell su -c "cp /sdcard/update_mad.sh /system/bin/update_mad.sh"
# adb -s %1:5555 shell su -c "chmod 555 /system/bin/update_mad.sh"
# adb -s %1:5555 shell su -c "mount -o ro,remount /system"

function stop_mad(){
	echo "stopping MAD processes"
	/system/bin/killall com.mad.pogodroid
	/system/bin/am force-stop de.grennith.rgc.remotegpscontroller
	echo
}

function reboot_device(){
	if [[ "$USER" == "shell" ]] ;then
		echo "Rebooting Device"
		/system/bin/reboot
	fi
}

function update_pogodroid(){
	echo "updating PogoDroid..."
	echo "Delete old APK PogoDroid"
	/system/bin/rm -f /sdcard/Download/PogoDroid.apk
	echo "Download APK PogoDroid"
	cd /sdcard/Download/
	/system/bin/curl -L -o PogoDroid.apk -k -s https://www.maddev.de/apk/PogoDroid.apk
	echo "Install APK PogoDroid"
	/system/bin/pm install -r /sdcard/Download/PogoDroid.apk
	echo
}

function update_rgc(){
	echo "updating RGC..."
	echo "Delete old APK RGC"
	/system/bin/rm -f /sdcard/Download/RemoteGpsController.apk
	echo "Download APK RGC"
	cd /sdcard/Download/
	/system/bin/curl -L -o RemoteGpsController.apk -k -s https://raw.githubusercontent.com/Map-A-Droid/MAD/master/APK/RemoteGpsController.apk
	echo "Install APK RGC"
	/system/bin/pm install -r /sdcard/Download/RemoteGpsController.apk
	echo
}

function update_pokemon(){
	echo "updating PokemonGo..."
	echo "Delete old APK PokemonGo"
	/system/bin/rm -f /sdcard/Download/pogo.apk
	echo "Download APK PokemonGo"
	cd /sdcard/Download/
	/system/bin/curl -s -k -A "Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3" -L -o /sdcard/Download/pogo.apk "https://www.apkmirror.com/wp-content/themes/APKMirror/download.php?id=$(curl -s -k -A "Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3" -L 'https://www.apkmirror.com/apk/niantic-inc/pokemon-go/variant-%7B%22arches_slug%22%3A%5B%22armeabi-v7a%22%5D%7D/'| grep data-postid|head -n1|awk -F'"' '{print $14}')"
	echo "Install APK PokemonGo"
	/system/bin/pm install -r /sdcard/Download/pogo.apk
	echo
}

function update_init(){
	echo "updating init scripts..."
	/system/bin/curl -o /etc/init.d/16mad -k -s https://raw.githubusercontent.com/Map-A-Droid/MAD-ATV/master/16mad && chmod +x /etc/init.d/16mad
	echo
}

function print_help(){
	echo "install:"
	echo "su"
	echo "mount -o rw,remount /system"
	echo "cp /<SCRIPTPATH>/update_mad.sh /system/bin/update_mad.sh"
	echo "chmod 555 /system/bin/update_mad.sh"
	echo "mount -o ro,remount /system"
	echo ""
	echo "just run: /usr/bin/adb -s <DEVICEIP>:5555 shell su -c \"update_mad.sh <options>\""
	echo ""
	echo "Options:"
	echo "          -r   (Update RemoteGPSController)"
	echo "          -p   (Update PokemonGO)"
	echo "          -d   (Update PogoDroid)"
        echo "          -i   (Update MAD ROM init script)"
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
			UpdateInit=1
			;;
		-c)
			ClearCache=1
			;;
		-i)
			UpdateInit=1
			;;
		*)
			print_help
			exit 1
			;;
	esac
done

((($UpdateRGC)) || (($UpdatePogoDroid)) || (($UpdatePoGo))) && stop_mad
(($UpdateRGC))       && update_rgc
(($UpdatePogoDroid)) && update_pogodroid
(($UpdatePoGo))      && update_pokemon
(($ClearCache)) && echo "clearing cache of app pokemongo" && /system/bin/pm clear com.nianticlabs.pokemongo
(($UpdateInit))      && update_init
((($UpdateRGC)) || (($UpdateInit)) || (($UpdatePogoDroid)) || (($UpdatePoGo))) && reboot_device

exit
