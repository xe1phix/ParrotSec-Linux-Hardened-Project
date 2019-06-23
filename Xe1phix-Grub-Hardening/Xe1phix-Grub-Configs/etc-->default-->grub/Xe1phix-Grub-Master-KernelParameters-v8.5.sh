# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.
# For full documentation of the options in this file, see:
#   info -f grub -n 'Simple configuration'

GRUB_DEFAULT=0
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="debug"
GRUB_CMDLINE_LINUX="debug time security=apparmor apparmor=1 rodata=on kalsr noipv6 disable_ipv6=1 ipv6.disable=1 ipv6.autoconf=0 acl user_xattr noconfig=sudo noefi efi=noruntime rfkill.default_state=0 rfkill.master_switch_mode=2 systemd.restore_state=1 noautologin lp=0 lang=US xkeyboard=US keyboard-layout=en uid=1000 mode=0744 nosuid noautomount data=journal journal_checksum systemd.log_level=notice noeject edd=off userfullname=xe1phix nonfs vga=normal xforcevesa modprobe.blacklist=drm,bluetooth,btusb,hfs,hfsplus,appletalk,appledisplay,apple_bl,apple-gmux,applesmc,efivars,efivarfs,efi_pstore,hid_microsoft,hid-apple, systemd.mask=ModemManager,mysql,postgresql,apache2,mysql,lighttpd,postfix,iscsi,iscsid,rwhod,sshd,ssh,beef-xss,mysqld,printer,rpcbind fsck.mode=auto"

# Uncomment to enable BadRAM filtering, modify to suit your needs
# This works with Linux (no patch required) and with any kernel that obtains
# the memory map information from GRUB (GNU Mach, kernel of FreeBSD ...)
#GRUB_BADRAM="0x01234567,0xfefefefe,0x89abcdef,0xefefefef"

# Uncomment to disable graphical terminal (grub-pc only)
#GRUB_TERMINAL=console

# The resolution used on graphical terminal
# note that you can use only modes which your graphic card supports via VBE
# you can see them in real GRUB with the command `vbeinfo'
#GRUB_GFXMODE=640x480

# Uncomment if you don't want GRUB to pass "root=UUID=xxx" parameter to Linux
#GRUB_DISABLE_LINUX_UUID=true

# Uncomment to disable generation of recovery mode menu entries
#GRUB_DISABLE_RECOVERY="true"

# Uncomment to get a beep at grub start
#GRUB_INIT_TUNE="480 440 1"
