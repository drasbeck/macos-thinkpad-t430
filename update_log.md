# Updates
This file contains a running log of the changes made between macOS versions. It serves as a reference for me, whenever a new update is released.

Return to [README.md](README.md)

### Updating from Sierra to High Sierra (10.12.6) (Windows edition)
#### (I did not do this, it's here for educational purposes)
	- Downloaded full macOS 10.13.6 from App Store
	- Copy latest apfs.efi to /EFI/Clover/drivers64UEFI
	- Backup all kext and update with Install High Sierra.app
	- Disable default volumes, set timeout 10s (If necessary)
	- If post update boot fails:
		Use a windows machine
		Download Clover Iso [here](https://sourceforge.net/projects/cloverefiboot/files/Bootable_ISO/)
		Extract with 7zip
		Use [rufus](https://rufus.akeo.ie) to burn iso to usb
		Delete all drivers64UEFI in clover and replace drivers64UEFI in this repo
		Delete all kext except Other and paste all kext in this repo
		Replace config.plist with the one in this repo
		Copy apfs.efi to /EFI/Clover/drivers64UEFI
		Boot to usb and select volumes update
		Do not enable File Vault during setup.
	- Flushed kext cache to get audio working again.
	- sudo touch /System/Library/Extensions && sudo kextcache -u /
	- Reboot :D

### Updating from 10.13.0 to 10.13.1
	- Downloaded full macOS 10.13.1 from App Store.
	- Copied kexts and apfs.efi to their respective places in EFI.
	- Installed macOS 10.13.1
	- Flushed kext cache to get audio working again.
		sudo touch /System/Library/Extensions && sudo kextcache -u /
	- Remove kexts from EFI.
	- Reboot and voilà. =)

### Updating from 10.13.1 to 10.13.2
	- Downloaded newest FakeSMC.kext -> installed in bootloader.
	- Ran `softwareupdate -i -a`.
	- Rebooted after installation and chose the Install option in Clover.
	- Flushed kext cache to get audio working again with KextUtility.
		- At the same time installed the new FakeSMC.kext.
	- Reboot and voilà once more. =)

### Updating from 10.13.2 to 10.13.2 Supplemental Update
	- Downloaded newest FakeSMC.kext -> installed in bootloader.
	- Ran `softwareupdate -i -a`.
	- Rebooted after installation and chose the Install option in Clover.
	- And voilà! =)

### Updating from 10.13.2 Supplemental Update to 10.13.3
	- Ran `softwareupdate -i -a`.
	- Rebooted after installation and chose the Install option in Clover.
	- Flushed kext cache to get audio working again with KextUtility.
	- Reboot and voilà! =)
	- Kept FakeSMC.kext in EFI

### Updating from 10.13.3 to 10.13.3 Supplemental Update
	- Ran `softwareupdate -i -a`.
	- Rebooted after installation and (automatically) chose the Install option in Clover.
	- Everyting (including sound) worked without a kext cache flush.
	- And voilà! =)

### Updating from 10.13.3 Supplemental Update to 10.13.4
	- Ran `softwareupdate -i -a`.
	- Installed new apfs.efi in /EFI/CLOVER/drivers64UEFI/
	- Rebooted 2x after installation and automatically chose the Install option in Clover.
	- Flushed kext cache to get audio working again with KextUtility.
	- Reboot and voilà! =)
	- Kept FakeSMC.kext in EFI

### Updating from 10.13.4 to 10.13.4 Security Update
	- Updated apfs.efi
	- Ran `softwareupdate -i -a`.
	- Rebooted after installation and (automatically) chose the Install option in Clover.
	- Everyting (including sound) worked without a kext cache flush.

### Updating from 10.13.4 Security Update to 10.13.5
	- Installed new apfs.efi in /EFI/CLOVER/drivers64UEFI/
	- Ran `softwareupdate -i -a --restart`.
	- Rebooted 2x after installation and automatically chose the Install option in Clover.
	- Removed BrcmBluetoothInjector.kext from /S/L/E
	- Added and updated the following bluetooth related kexts in /S/L/E
	    - BrcmFirmwareRepo.kext (updated)
	    - BrcmNonPatchRAM2.kext (updated)
	    - BrcmPatchRAM2.kext (added)
	- Flushed kext cache to get audio working again with KextUtility.
	- Reboot and voilà! =)

### Updating from 10.13.5 to 10.13.6
	- Installed new apfs.efi in /EFI/CLOVER/drivers64UEFI/
	- Ran `softwareupdate -i -a --restart`.
	- Flushed kext cache to get audio working again (with KextUtility).
	- Reboot and everything works againg. =)

### Updating from 10.13.6 to 10.14.0 Mojave
	- Installed new apfs.efi in /EFI/CLOVER/drivers64UEFI/
	- Updated to newest kexts
	- Moved all custom kexts from /S/L/E to /EFI/CLOVER/kexts/Other for easier future upgrades.
	- Copied old official IO80211Family.kext and IO80211FamilyV2.kext from HS S/L/E to Mojave S/L/E - to get Wi-Fi working (specific to my Wi-Fi adapter (Atheros AR5BHB92)).
	- Downloaded and ran macOS 10.14.0 installer from App Store
	- Rebooted after installation and (automatically) chose the Install option in Clover.
	- If sound does not work (which was my case), you need Lilu and AppleALC kexts, they can be found in the kexts folder.
	- Flush kext cache and see if audio is working again (with KextUtility).
	- If not (I did not need to do this):
		- Try adding -alcbeta -lilubeta to custom flags in Clover and set Devices -> Audio -> 28
		- Flush kext cache to get audio working again (with KextUtility).
	- Reboot and everything should work again. =)
	
### Updating from 10.14.0 to 10.14.1
	- Update AppleALC.kext to version 1.3.3 in /EFI/CLOVER/kexts/Other
		- get kext here: https://github.com/acidanthera/AppleALC/releases
	- Install old official IO80211Family.kext and IO80211FamilyV2.kext from HS S/L/E to Mojave S/L/E with KextUtility.
		- specific to non working Atheros adapters (e.g.: AR5BHB92)
	- Install update via Software Update.

### Updating from 10.14.1 to 10.14.2
	- Install update via Software Update.
	- Flush kext cache (to get audio).

### Updating from 10.14.2 to 10.14.3
	- Update AppleALC.kext and Lilu.kext via Clover Configurator.
	- Install update via Software Update.
	- Flush kext cache (to get audio).

### Updating from 10.14.3 to 10.14.3 Supplemental Update
	- Update outdated kexts and UEFI drivers via Clover Configurator.
	- Update to latest stable Clover, preserving settings from earlier install.
	- Install Supplemental Update via Software Update.
	- Flush kext cache (to get audio).
	
### Updating from 10.14.3 SupplementalUpdate to 10.14.4
	- Update Clover to at least rev. 4910
	- Update AppleALC to resolve audio issues.
	- Flush kext cache (to get audio).

### Updating from 10.14.4 to 10.14.5
	- Update outdated kexts and UEFI drivers via Clover Configurator.
	- Update to latest stable Clover, preserving settings from earlier install.
	- Install update via Software Update.
	- Flush kext cache (to get audio).

### Updating from 10.14.5 to 10.14.6
	- Update outdated kexts and UEFI drivers via Clover Configurator.
	- Install update via Software Update with reboots.
	- Flush kext cache (to get audio).

### Updating from 10.14.6 to 10.14.6 Supplemental Update (18G87)

### Updating from 10.14.6 Supplemental Update (18G87) to 10.14.6 Supplemental Update (18G95)
	- Update Clover to v 5058
	- Install update via Software Update with complementary reboots.
	- Flush kext cache (to get audio).
	
### Updating from 10.14.6 Supplemental Update (18G95) to 10.14.6 Supplemental Update 2
	- Install update via Software Update with complementary reboots.
	- Flush kext cache (to get audio).

### Updating from 10.14.6 Supplemental Update 2 to 10.15.0 Catalina
	- Update Clover to v 5070
	- Update EFI kexts to latest versions 
	- Install update via Software Update with complementary reboots (this took a looong time).
	- Flush kext cache (to get audio).
	- WiFi is working with gnarly fix, not sure if I could do better.

### Updating from 10.15.0 Catalina (19A583) to 10.15.0 Catalina (19A602)
	- Install update via Software Update with complementary reboots.
	- Move IO80211Family.kext to kexts/Other, now WiFi just works. =)
	- Flush kext cache (to get audio).
