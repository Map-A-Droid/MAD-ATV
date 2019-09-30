<p>
<ul>
<p style="text-align: ;"><strong>Flashing X96 Mini</strong> (<strong>S905W 2GB/16GB) via SD Card</strong><br>
<hr />
<strong>Image: </strong><strong>MAD RC7 ROM</strong><br>
<strong>Attention:
I don't force you to use this way. It's stable and can be used as daily driver. <br><br>- Read careful -</strong></h6><br><br>
<em>* We (MAD Team) are not responsible for bricked devices, dead SD cards,<br>
 * thermonuclear war, or you getting fired because you work to hard on this project. <br> * Please do some research before flashing<br>
 * Please do some research for resizing and reformating SD cards to FAT<br>
 * YOU are choosing to make these modifications, and if you point the finger at us for messing up your device, We will laugh at you.<br>
 </em>
<hr />
</ul>
<ul>
<h3>Prerequisite:</h3>
<ul>
 	<li>X96 Mini (<strong>S905W)</strong></li>
 	<li>Windows 7-10 Environment</li>
 	<li>2GB+ SD Card</li>
 	<li>Cardreader</li>
 	<li>brain.ps1</li>
 	<li>Toothpick</li>
 	<li>USB Keyboard + Mouse</li>
 	<li><b>Needed downloads:</b></li>
	<ul>
 	<li>MAD<strong> RC7</strong> ROM<strong></strong> [ <a href="https://github.com/Map-A-Droid/MAD-ATV/releases/download/rc7/MAD-s905w-RC7.img">direct link</a> ] or <a href="https://github.com/Map-A-Droid/MAD-ATV/releases/tag/rc7">[ here ]</a></li>
 	<li>Burn_Card_Maker.exe [ <a href="https://share108.com/06r0pntu2p6h/Burn_Card_Maker%E5%B7%A5%E5%85%B7.rar">direct link</a> ], [ <a href="https://www.mediafire.com/?v28g81wjx25dyk3">direct link</a> ] or [ <a href="http://www.filefactory.com/file/7d4u08th9qpn/Burn_Card_Maker%E5%B7%A5%E5%85%B7.rar">direct link</a> ]</li>
 	</ul></ul><p>
 
<hr />
<h3>Prepare your SD Card:</h3>
<h4><strong>** Important **</strong></h4>
Make sure youre formatting your SD Card with a <strong>FAT(16)</strong> partitionschema - <strong>otherwise the flash will fail on 10% with a red X under the Android.
<br><br>If you see a red x - you have failed to set up your SD card correctly (to FAT schema)</strong>
<p>
<ul>
 	<li>Start <em>compmgmt.msc</em></li>
 	<li>Navigate -&gt; Disk Management (Datenträgerverwaltung)</li>
 	<li>Look for SD Card</li>
 	<li>Delete the whole (f.e. 8GB) partition</li>
 	<li>Create a new one with >=4000MB</li>
 	<li>format with FAT16</li>
<a href="https://pixlblog.pixlmap.de/wp-content/uploads/2019/06/fat16.png"><img class="wp-image-229 size-full" src="https://pixlblog.pixlmap.de/wp-content/uploads/2019/06/fat16.png" alt="" width="490" height="383" /></a>
</ul>
<hr />

<h3>Flash MAD-ROM to SD:</h3>
<ul>
 	<li>Start Burn_Card_Maker.exe
 	<li>Hit the menu and tick english language</li>

<a href="https://pixlblog.pixlmap.de/wp-content/uploads/2019/06/burnen.png"><img class="wp-image-226 " src="https://pixlblog.pixlmap.de/wp-content/uploads/2019/06/burnen.png" alt="" width="225" height="211" /></a>
</ul>
&nbsp;
<ul>
<li>Make sure, you are selecting the right volume letter of your SD card!</li>
 	<li>Flash the MAD RC7 ROM Imagefile with Burn_Card_Maker with '<em>make</em>'</li>
<a href="https://pixlblog.pixlmap.de/wp-content/uploads/2019/06/burncardmaker2.png"><img class="wp-image-181 aligncenter" src="https://pixlblog.pixlmap.de/wp-content/uploads/2019/06/burncardmaker2.png" alt="" width="405" height="291" /></a>
</ul>
<hr />

<h3>Booting into flashingmode:</h3>
<ul>
 	<li>Shutdown X96</li>
 	<li>Put your <strong>SD</strong> Card <strong>into</strong> the X96</li>
 	<li>Use a <strong>toothpick</strong> and <strong>hold</strong> the button <em>inside</em> the <strong>AV </strong>slot!</li>
 	<li><strong>Add</strong> <strong>DC</strong></li>
 	<li>X96 should boot directly into <strong>Flashingmode</strong></li>
 	<li><strong>release</strong> <strong>toothpick</strong></li>
 	<li>let the <strong>flash</strong> process end</li>
 	<li>X96 Mini should reboot</li>
</ul>
<strong>Let the system fully boot.</strong>
<hr />
<h3>Setup box & configuring magisk/smali and NFS:</h3>
<ul>
<li>Fill in the setup menu fast if you can, once the box has internet it will download and install the latest pogodroid and RGC.</li>
<li>After it finishes this it will boot in to TWRP. <b>(WARNING: The TWRP-screen may potentially trigger seizures for people with photosensitive epilepsy.)</b></li>
<ul>
<li>In TWRP slide to allow system mods, then choose <b>install</b> and select <b>Magisk-v18.1.zip</b>, then <b>add more zips</b> and select <b>smali.zip</b>, then add more zips and select the <b>NFS module zip.</b></li>
<li>Install the zips and then wipe cache/dalvik cache.</li></ul>
<li>Now is the time to plug in your USB stick if you want to use <a href="https://github.com/Map-A-Droid/MAD-ATV/blob/master/README_autoconfig.md">RGC/pogodroid autoconfig</a> (available since RC5). If you do that when you reboot they should configure themselves from your USB.</li>
<li>Reboot the system and let Android load. You must not reboot again for at least 5 minutes according to the NFS module docs.</li>
<li>Go to Android settings, about, scroll down and click build until it says you are a developer. Then go to Android settings - developer settings - turn on "stay awake"</li>
<li>Now go to magisk and double check that you pass safetynet.</li>
<li>In magisk settings repackage magisk.</li>
<li>Go open RGC and Pogodroid and give them the permissions they need.</li></ul>
<li>Now go to pokemon go and sign in. You will need to use scrcpy or teamviewer to enter data in to the pokemon go app.</li>
</ul>
<strong>Have fun!</strong>
<hr />
<h3>Hint:</h3>
<ul>
 	<li>RJ45 connection is recommend</li>
 	<li><strong>If you want to scan quests</strong> - Use Portaitmode
 	<li>Switch to 480p res if you're ready to go (Settings/Display/Screen Resolution/Display Mode)</li>
 	<li>Use Teamviewer.apk to remote control your games (Some games don't reacting on keyboards) or use <strong>scrcpy</strong>!</li>
</ul>

<hr />
<h3>Suggested ATV settings:</h3>
<ul>
 	<strong><li>RGC</li></strong>
	<ul>
	<li>Autostart services after 5 seconds.
	</ul>
	<strong><li>PogoDroid</li></strong>
	<ul>
	<li>Autostart services after 35 seconds.</li>
	<li>Injection after 120 seconds.</li>
	</ul>
</ul>
<hr />
# Contribute
If you know it better, feel free to PR your wisdom
