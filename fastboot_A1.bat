
fastboot -i 0x2A96 getvar product 2>&1 | findstr /r /c:"^product: *MSM8916" || echo Missmatching image and device
fastboot -i 0x2A96 getvar product 2>&1 | findstr /r /c:"^product: *MSM8916" || exit /B 1


fastboot -i 0x2A96 oem unlock

fastboot -i 0x2A96 erase boot
fastboot -i 0x2A96 flash system %~dp0images\system.img
fastboot -i 0x2A96 flash cache %~dp0images\cache.img
fastboot -i 0x2A96 flash userdata %~dp0images\userdata.img
fastboot -i 0x2A96 flash recovery %~dp0images\recovery.img
fastboot -i 0x2A96 flash boot %~dp0images\boot.img

fastboot -i 0x2A96 reboot

