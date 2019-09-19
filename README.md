## 
#  _____ <!> ParrotSec Linux - Public Kiosk Project <!> ______
## Designing & Implementing A restricted & Trustworthy Environment 

<p align="center">
  <a href="https://gitlab.com/xe1phix/ParrotLinux-Public-Kiosk-Project">
    <img src="https://img.shields.io/badge/Gitlab-ParrotLinux--Public--Kiosk--Project-rebeccapurple?style=flat&logo=gitlab" alt="@Xe1phix on Gitlab">
  </a>
   <a href="https://gitlab.com/xe1phix/ParrotLinux-Public-Kiosk-Project/tree/master/Xe1phix-Modprobe.d">
    <img src="https://img.shields.io/badge/Xe1phix-Modprobe_Blacklisting-darkred?style=flat&logo=gitlab" alt="Modprobe Blacklisting">
  </a>
  <a href="https://gitlab.com/xe1phix/ParrotLinux-Public-Kiosk-Project/tree/master/Xe1phix-Grub-Hardening/Xe1phix-Kernel-Command-Line-Parameters">
    <img src="https://img.shields.io/badge/Xe1phix-Kernel_Commandline_Parameters-darkred?style=flat&logo=gitlab" alt="Xe1phix Kernel Parameter Hardening">
  </a>
  <a href="https://gitlab.com/xe1phix/ParrotLinux-Public-Kiosk-Project/tree/master/Xe1phix-BuildingTrust">
    <img src="https://img.shields.io/badge/Xe1phix-Building_Trust-sucess?style=flat&logo=gitlab" alt="Xe1phix Building Trust Series">
  </a>
</p>
<br>

- [ ] Hardened kernel

        - [ ] GrSecurity Patched Kernel
                - [ ] PaX Hardening
                        - [x] PaXctl
                        - [x] PaXTest
                        - [x] PaXctld
                        - [x] 


- [x] Hardened Kernel Runtime Parameters

        - [x] Blacklist IPv6
                - [x] ipv6.disable=1
                - [x] noipv6
                - [x] ipv6.autoconf=0


        - [x] Modprobe Blacklisting
                - [x] Bluetooth Blacklisting
                        - [x] btsdio            - Bluetooth SDIO driver
                        - [x] btusb             - 
                        - [x] btintel           - Intel
                        - [x] btrtl             - Realtek Bluetooth
                        - [x] bt3c_cs           - 3Com Bluetooth PCMCIA
                        - [x] btmrvl            - Bluetooth driver ver 1.0
                        - [x] btmrvl_sdio       - BT-over-SDIO
                        - [x] btqca                 - Qualcomm Atheros family
                        - [x] btbcm                 - Broadcom
                        - [x] bluetooth_6lowpan     - Bluetooth 6LoWPAN
                        - [x] rfcomm                - Bluetooth RFCOMM ver 1.11
                        - [x] bluecard_cs           - Anycom BlueCard (LSE039/LSE041)


                - [x] Apple Blacklisting
                        - [x] appletalk
                        - [x] thunderbolt_net
                        - [x] 
                        - [x] hfs
                        - [x] hfsplus
                        - [x] appletouch
                        - [x] hid-apple


                - [x] EFI Blacklisting:
                        - [x] efivars
                        - [x] efivarfs
                        - [x] efi_pstore



                        