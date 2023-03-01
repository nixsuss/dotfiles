* Make sure to install rust-bin before updating the whole system.

emerge -aq rust-bin

* To install (kernel+initramfs+microcode) simply run this cli:

emerge -aq sys-kernel/linux-firmware sys-kernel/gentoo-sources sys-firmware/intel-microcode genkernel sys-apps/pciutils app-arch/lzop app-arch/lz4

eselect kernel set 1

genkernel --microcode-initramfs all

* Install Grub and some packages.

emerge -aq sys-boot/grub os-prober neofetch

* Make sure you set GRUB_GFXPAYLOAD_LINUX="keep" in /etc/defaut/grub


* If you want to disable this annoying password settings in gentoo, you have to comment this in /etc/pam.d/system-auth :

password	required	pam_passwdqc.so config=/etc/security/passwdqc.conf by '#' to be 
#password	required	pam_passwdqc.so config=/etc/security/passwdqc.conf

and delete any extra words in the next line to be like this:

password	required	pam_unix.so nullok sha512 shadow

* add user.

useradd -m -G users,wheel,audio,video -s /bin/bash ahmed

* After reboot the system make sure that microcode updated by running this cli :

dmesg | grep -i "microcode"
 
* If you don't have a wifi card then don't install networkmanager.
