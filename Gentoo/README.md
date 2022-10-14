* make sure you set GRUB_GFXPAYLOAD_LINUX="keep" in /etc/defaut/grub


* if you want to disable this annoying password settings in gentoo, you have to comment this:

password	required	pam_passwdqc.so config=/etc/security/passwdqc.conf by '#' to be 
#password	required	pam_passwdqc.so config=/etc/security/passwdqc.conf

and delete any extra words in the next line to be like this:

password	required	pam_unix.so nullok sha512 shadow


* if you don't have a wifi card then don't install networkmanager.
