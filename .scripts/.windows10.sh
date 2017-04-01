grub-reboot "$(grep -i 'Windows 10' /boot/grub/grub.cfg|cut -d"'" -f2)" && reboot
