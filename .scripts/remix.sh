sudo grub-reboot "$(sudo grep -i 'Remix OS' /boot/grub/grub.cfg|cut -d"'" -f2)" && reboot
