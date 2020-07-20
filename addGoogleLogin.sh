#!/system/bin/sh
if [ ! -f /sdcard/google-account ]
	am start -a android.settings.ADD_ACCOUNT_SETTINGS
		sleep 40
	input keyevent 20
	input keyevent 20
		sleep 5
	input text $(sed -n 1p /sdcard/google-account) 
		sleep 5 
	input keyevent 66 
		sleep 5
	input keyevent 20
		sleep 5
	input text $(sed -n 2p /sdcard/google-account)
		sleep 5
	input keyevent 66 
		sleep 5
	i=0
	while [ $i -le 9 ]; do 
		input keyevent 20
		let i=$i+1
		sleep 1; done
	input keyevent 66
		sleep 5
	y=0
	while [ $y -le 3 ]; do
		input keyevent 20
		let y=$y+1
		sleep 1; done
	input keyevent 66
	echo "done"
fi