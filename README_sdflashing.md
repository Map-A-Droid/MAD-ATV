<p>
<ul>
<p style="text-align: ;"><strong>Flashing X96 Mini</strong> (<strong>S905W 2GB/16GB) via SD Card</strong><br>
<hr />
<strong>Image: </strong><strong>MAD ROM</strong><br>
<strong>Attention:<br>
We don't force you to use this way. It's stable and can be used as daily driver. Make sure youre read this how to carefully, if you miss a step it could cause to a bricked ATV. <br><br>- Read careful -</strong></h6><br><br>
<em>* We (MAD Team) are not responsible for bricked devices, dead SD cards, thermonuclear war, or you getting fired because you work too hard on this project. <br> * Please do some research before flashing<br>
 * Please do some research for resizing and reformating SD cards to FAT <a href="https://www.instructables.com/id/Format-USB-Flash-Drive-to-FATFAT16-not-FAT32/"> -> [ read this ]</a> <br>
 * YOU are choosing to make these modifications, and if you point the finger at us for messing up your device, We will laugh at you.<br> * This method uses the stock recovery, so it can only be used once after that you need to go back to stock recovery or use the USB method to flash again. <br> * This method does not check that the rom is ok for your board, the USB method does check. If you use this method you may brick your box if the board does not work with the MAD rom.
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
 	<li>MAD ROM [ <a href="https://github.com/Map-A-Droid/MAD-ATV/releases"> direct link</a> ] </li>
 	<li>Burn_Card_Maker.exe [ <a href="https://github.com/Map-A-Droid/MAD-ATV/releases/download/tools/Burn_Card_Maker_V2.0.3.zip">direct link</a> ]</li>
 	</ul></ul><p>
 
<hr />
<h3>Prepare your SD Card:</h3>
<h4><strong>** Important **</strong></h4>
Make sure youre formatting your SD Card with a <strong>FAT(16)</strong> partitionschema - <strong>otherwise the flash will fail on 10% with a red X under the Android.
<br><br>If you see a red x - you have failed to set up your SD card correctly (to FAT schema)</strong>
<p>
<ul>
 	<li>Start <em>compmgmt.msc</em> on your Microsoft Windowssystem</li>
 	<li>Navigate -&gt; Disk Management (Datenträgerverwaltung)</li>
 	<li>Look for SD Card</li>
 	<li>Delete the whole (f.e. 8GB) partition</li>
 	<li>Create a new one with <=4096MB (FAT is able to address up to 4096MB)</li>
 	<li>format with FAT16</li>
</ul>
<hr />

<h3>Flash MAD-ROM to SD:</h3>
<ul>
 	<li>Start Burn_Card_Maker.exe
 	<li>Hit the menu and tick english language</li>
</ul>
<ul>
<li>Make sure, you are selecting the right volume letter of your SD card!</li>
	<li>Don't untick anything (DON'T EREASE BOOTLOADER!)</li>
 	<li>Flash the MAD RC ROM Imagefile with Burn_Card_Maker with '<em>make</em>'</li>
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
