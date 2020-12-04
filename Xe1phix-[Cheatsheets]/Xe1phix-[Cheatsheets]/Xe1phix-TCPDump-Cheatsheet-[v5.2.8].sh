


##-====================================-##
##     [+] Create An Alias For HTTP GET Traffic:
##-====================================-##
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""


##-=================================-##
##     [+] TCPDUMP all the data on port $1 
##            into rotated files /tmp/results
##-=================================-##
tcpdump -i any -s0 tcp port "$1" -A -w /tmp/$Results -C 100
  

##-=====================-##
##     [+] Display a pcap file
##-=====================-##
tcpdump -r $File.pcap


##-==============================-##
##     [+] Display ips and filter and sort
##-==============================-##
tcpdump -n -r $File.pcap | awk -F" " '{print $3}' | sort -u | head


##-================================-##
##     [+] Grab a packet capture on port 80
##-================================-##
tcpdump tcp port 80 -w $File.pcap -i eth0


##-===========================================-##
##     [+] Check for ACK or PSH flag set in a TCP packet
##-===========================================-##
tcpdump -A -n 'tcp[13] = 24' -r $File.pcap






##-============================-##
##				[?]  TCP connections
##-============================-##
##			SYN -> SYN/ACK -> ACK
##	DATA -> DATA/ACK -> ACK -> ACK
##			  FIN -> FIN/ACK -> ACK
##-============================-##
	


##-=====================-##
##     [+] Monitor TCP traffic
##-=====================-##
tcpdump -n -tttt -i eth0 tcp


##-=====================-##
##     [+] Monitor ftp traffic:
##-=====================-##
tcpdump -A port ftp -v


##-====================================================-##
##  [+] Save to pcap file and display data on screen
##-====================================================-##
tcpdump -n -w - port 8080 |tee $File.pcap |tcpdump -A -r -



##-==================================-##
##     [+] Capture Packets on Port 80
##-==================================-##
tcpdump -A -s0 port 80


##-==============================-##
##  [+] Filter on UDP traffic
##-==============================-##
tcpdump -i eth0 udp
tcpdump -i eth0 proto 17




##-=========================================-##
##  [+] Capture Hosts based on IP address
##-=========================================-##
tcpdump -i eth0 host 10.10.1.1


##-===========================================================-##
##  [+] Capture only packets going one way using src or dst
##-===========================================================-##
tcpdump -i eth0 dst 10.10.1.20




##-=============================-##
##  [+] Write a capture file
##-=============================-##
tcpdump -i eth0 -s0 -w $File.pcap





##-========================================================-##
##  [+] Line Buffered Mode
## ----------------------------------------------------------- ##
##  [?] buffered (or packet buffered -C) mode
## ----------------------------------------------------------- ##
tcpdump -i eth0 -s0 -l port 80 | grep 'Server:'



##-========================================================-##
##   [+] Extract HTTP User Agent from HTTP request header
##-========================================================-##
tcpdump -nn -A -s1500 -l | grep "User-Agent:"


##-===================================================-##
##   [+]  Extract User Agent + Header From Packets:
##-===================================================-##
## ------------------------------------------------------------------- ##
##   [?] use egrep and multiple matches we can get the User Agent 
##        and the Host (or any other header) from the request.
## ------------------------------------------------------------------- ##
tcpdump -nn -A -s1500 -l | egrep -i 'User-Agent:|Host:'


##-==============================================-##
##  [+] Capture only HTTP GET and POST packets
##-==============================================-##
tcpdump -s 0 -A -vv 'tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x47455420'


##-====================================-##
##  [+] Select Only on POST Requests:
##-====================================-##
## ------------------------------------------------------------------------ ##
##  [?] Match the hexadecimal GET and POST ascii Fingerprints in Packets
## ------------------------------------------------------------------------ ##
tcpdump -s 0 -A -vv 'tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x504f5354'


##-===================================-##
##  [+] Extract HTTP Request URLs
##-===================================-##
## ----------------------------------------------------------- ##
##  [?] Parse Host and HTTP Request location from traffic
## ----------------------------------------------------------- ##
tcpdump -s 0 -v -n -l | egrep -i "POST /|GET /|Host:"



##-==============================================-##
##  [+] Extract HTTP Passwords in POST Requests
##-==============================================-##
tcpdump -s 0 -A -n -l | egrep -i "POST /|pwd=|passwd=|password=|Host:"


##-==================================================-##
##  [+] Capture Cookies from Server and from Client
##-==================================================-##
tcpdump -nn -A -s0 -l | egrep -i 'Set-Cookie|Host:|Cookie:'


##-================================-##
##  [+] Capture all ICMP packets
##-================================-##
tcpdump -n icmp


##-=================================================================-##
##  [+] Show ICMP Packets that are not ECHO/REPLY (standard ping)
##-=================================================================-##
tcpdump 'icmp[icmptype] != icmp-echo and icmp[icmptype] != icmp-echoreply'


##-============================-##
##     [+] Capture SMTP / POP3 Email
##-============================-##
## ----------------------------------- ##
##  [?] Parse the email recipients
## ----------------------------------- ##
tcpdump -nn -l port 25 | grep -i 'MAIL FROM\|RCPT TO'



##-===================-##
##    [+] SMTP Analysis
##-===================-##
tcpdump -l -s0 -w - tcp dst port 25 | strings | grep -i 'MAIL FROM\|RCPT TO'

##-=======================================-##
##  [+] Extract NTP Query and Response
##-=======================================-##
tcpdump dst port 123


##-=======================================-##
##  [+] Capture SNMP Query and Response
##-=======================================-##
tcpdump -n -s0  port 161 and udp


##-==============================================-##
##  [+] Capture FTP Credentials and Commands
##-==============================================-##
## ______________________________________________
## ---------------------------------------------- ##
##  [?] Capture FTP Connections (TCP port 20)
## ---------------------------------------------- ##
##  [?] FTP Commands: LIST, CWD and PASSIVE
## ---------------------------------------------- ##
## ______________________________________________
## ---------------------------------------------- ##
##  [?] After the authentication is established 
##      an FTP session can be active or passive 
## ---------------------------------------------- ##
tcpdump -nn -v port ftp or ftp-data



##-=============================-##
##  [+] Rotate Capture Files
##-=============================-##
## ----------------------------------------------------------- ##
##  [?] The file capture-(hour).pcap 
##      will be created every (-G) 3600 seconds (1 hour). 
##      The files will be overwritten the following day. 
##      So you should end up with capture-{1-24}.pcap, i
## ----------------------------------------------------------- ##
tcpdump  -w /tmp/capture-%H.pcap -G 3600 -C 200



##-=================================================-##
##  [+] Capture IPv6 traffic using the ip6 filter
##-=================================================-##
tcpdump -nn ip6 proto 6


##-==================================================================-##
##  [+] Read IPv6 UDP Traffic from a previously saved capture file
##-==================================================================-##
tcpdump -nr $File.pcap ip6 proto 17



##-==============================================-##
##  [+] Test Network For Someone Running Nmap: 
##-==============================================-##
## ---------------------------------------------- ##
##  [?] Detect Port Scan in Network Traffic
## ---------------------------------------------- ##
tcpdump -nn port 80 | grep "GET /"


##-=============================================================-##
##  [+] Capture Start and End Packets of every non-local host
##-=============================================================-##
## ------------------------------------------------------------- ##
##  [?] Show each established TCP conversation with timestamps
## ------------------------------------------------------------- ##
tcpdump 'tcp[tcpflags] & (tcp-syn|tcp-fin) != 0 and not src and dst net localnet'



##-=================================================-##
##  [+] Capture DNS Request and Response Packets
##-=================================================-##
## ------------------------------------------------- ##
##  [?] Outbound DNS request to Google public DNS 
##      and the A record (ip address) response
## ------------------------------------------------- ##
tcpdump -i eth0 -s0 port 53


##-=================================-##
##  [+] Capture HTTP data packets
##-=================================-##
## --------------------------------------------------------------- ##
##  [?] Only capture on HTTP data packets on port 80. 
## --------------------------------------------------------------- ##
##  [?] Avoid capturing the TCP session setup (SYN / FIN / ACK)
## --------------------------------------------------------------- ##
tcpdump 'tcp port 80 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)'



##-==================================================-##
##  [+] Capture with tcpdump and view in Wireshark
##-==================================================-##
'tcpdump -s0 -c 1000 -nn -w - not port 22' | wireshark -k -i -



##-========================================-##
##  [+] Capture Top Hosts by Packets
##-========================================-##
## ---------------------------------------- ##
##  [?] List the top number of packets 
##  [?] Extract the IP address
##  [?] Sort and count the occurrances
## ---------------------------------------- ##
tcpdump -nnn -t -c 200 | cut -f 1,2,3,4 -d '.' | sort | uniq -c | sort -nr | head -n 20



##-===========================================-##
##  [+] Capture all the plaintext passwords
##-===========================================-##
## -------------------------------------------------------- ##
##  [?] capture passwords (hostname, ip address, system)
## -------------------------------------------------------- ##
tcpdump port http or port ftp or port smtp or port imap or port pop3 or port telnet -l -A | egrep -i -B5 'pass=|pwd=|log=|login=|user=|username=|pw=|passw=|passwd=|password=|pass:|user:|username:|password:|login:|pass |user '



##-========================================-##
##  [+] Capture DHCP Request And Replies:
##-========================================-##
## ---------------------------------------------------------------- ##
##  [?] DHCP requests are seen on port 67 and the reply is on 68.
## ---------------------------------------------------------------- ##
tcpdump -v -n port 67 or 68



# record the capture data to a file.
$ sudo tcpdump -i ens33 udp port 53 -w $File.pcap



# read the results of the capture.
$ sudo tcpdump -n -t -r $File.pcap port 53




tcpdump -i any -s0 -w $File.pcap
tcpdump -i eth0 -w capture -n -U -s 0 src not 192.168.1.X and dst not 192.168.1.X
tcpdump -vv -i eth0 src not 192.168.1.X and dst not 192.168.1.X








tcpdump -i wlan0 -vvv -A | grep "GET"




This will grep all GET from the wlan0 interface. 
This will not get any SSL-encrypted traffic.

sudo tcpdump -i wlan0 src port 80 or dst port 80 -w port-80-recording.pcap
sudo tcpdump -i eth0 src port 80 or dst port 80 -w port-80-recording.pcap



Print the traffic in hex with ascii interpretation.

tcpdump -nX -r $File.pcap



Only record tcp-traffic

tcpdump tcp -w $File.pcap




##-===============================-##
##     [+] Dump Packets By Domain
##-===============================-##
tcpdump -i eth0 -nt -s 500 port domain


##-======================================-##
##  [+] Filter By Domain Using Regex:
##-======================================-##
tcpdump -i eth0 -nt port 53 | grep $DomainDNS



##-=====================================-##
##     [+] CAPTURE PACKETS ON ETH0 
##           IN ASCII AND HEX AND WRITE TO FILE
##-=====================================-##
tcpdump -i ethO -XX -w $File.pcap


##-===================================-##
##     [+] CAPTURE HTTP TRAFFIC TO 2.2.2.2
##-===================================-##
tcpdump -i ethO port 80 dst 2.2.2.2


##-=============================-##
##     [+] Capture Ping Echo Requests:
##-=============================-##
tcpdump -nni eth0 -e icmp[icmptype] == 8


##-===========================-##
##     [+] Capture Ping Responses:
##-===========================-##
tcpdump -i ethO 'icmp[icmptype] == icmp-echoreply'      ## PRINT ALL PING RESPONSES



##-================================================-##
##     [+] CAPTURE 50 DNS PACKETS AND PRINT TIMESTAMP
##-================================================-##
tcpdump -i ethO -c 50 -tttt 'udp and port 53' 


##-======================================-##
##     [+] CAPTURE TCP TRAFFIC ON PORT 22-23
##-======================================-##
tcpdurnp -nvvX -sO -i ethO tcp portrange 22-23


##-===========================-##
##     [+] 
##-===========================-##
tcpdurnp -I ethO -tttt dst ip and not net 1.1.1.0/24    ## 


##-===============================-##
##     [+] Get Cisco network information:
##-===============================-##
tcpdump -nn -v -i eth0 -s 1500 -c 1 'ether[20:2] == 0x2000'



##-======================================-##
##     [+] SHOW CONNECTIONS TO A SPECIFIC IP
##-======================================-##
tcpdump -i ethO -tttt dst 192.168.1.22 and not net 192.168.1.0/24



##-========================================-##
##     [+] CAPTURE TRAFFIC FOR <SEC> SECONDS
##-========================================-##
durnpcap -I ethO -a duration: sec -w file $File.pcap


##-===================-##
##     [+] REPLAY PCAP
##-===================-##
file2cable -i ethO -f $File.pcap



tcpreplay --topspeed --loop=O --intf=ethO $PCAP -- mbps=10|100|1000




## ==================================================================================== ##
tcpick -i eth0 -C											## display the connection status:
## ==================================================================================== ##
tcpick -i eth0 -C -yP -h -a							## display the payload and packet headers:
## ==================================================================================== ##
tcpick -i eth0 -C -bCU -T1 "port 25"        ## display client data only of the first smtp connection:
## ==================================================================================== ##
tcpick -i eth0 -wR "port ftp-data"			## download a file passively:
## ==================================================================================== ##
tcpick -a														## Displays host names instead of ip addresses. 
## ==================================================================================== ##
tcpick -v5														## Verbose Lvl 1-5
## ==================================================================================== ##


## ==================================================================================== ##
tcpick   -i   eth0   --pipe  client  "port  80"  |  gzip  > $File.gz
## ==================================================================================== ##
tcpick -i eth0 --pipe server "port 25" | nc foobar.net 25
## ==================================================================================== ##


##-===============================================-##
##     [+] Process all of the pcap files in the current directory:
##-===============================================-##
tcpflow -o out -a -l *.pcap


##-===============================================-##
##     [+] Convert the hostname to an IPv4 address using DNS:
##-===============================================-##
nmap --dns-servers 8.8.8.8,8.8.4.4 scanme.nmap.org



 tcpdump -n -r $File.cap | awk '{print $3}'| sort -u
 tcpdump -n src host 145.254.160.237 -r $File.cap
 tcpdump -n dst host 145.254.160.237 -r $File.cap
 tcpdump -n port 53 -r $File.cap
 tcpdump -nX port 80 -r $File.cap

















