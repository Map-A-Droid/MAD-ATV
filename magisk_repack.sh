#!/system/bin/sh
echo "repacking magisk"
monkey -p com.topjohnwu.magisk 1
sleep 5
input tap 39 42
sleep 5
input tap 150 537
sleep 5
input tap 315 552
sleep 5
input tap 881 277
echo "done"
