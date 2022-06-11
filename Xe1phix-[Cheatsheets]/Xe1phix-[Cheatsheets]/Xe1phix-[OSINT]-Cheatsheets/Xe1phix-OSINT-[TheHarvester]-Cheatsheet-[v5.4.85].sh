#!/bin/sh


## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b all		    			##  Search Using All The Configured APIs
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b spyse					##  Search Using The Spyse API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b sublist3r				##  Search Using The Sublist3r API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b certspotter				##  Search Using The Certspotter API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b crtsh					##  Search Using The Crtsh API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b dnsdumpster				##  Search Using The DNSDumpster API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b censys					##  Search Using The Censys API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b hackertarget				##  Search Using The HackerTarget API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b hunter					##  Search Using The Hunter API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b netcraft					##  Search Using The Netcraft API
## ---------------------------------------------------------------------------------------------------------- ##


## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b jigsaw					##  Search Using The Jigsaw API
## ---------------------------------------------------------------------------------------------------------- ##

## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b github-code				##  Search Using The Github-Code API
## ---------------------------------------------------------------------------------------------------------- ##


## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b duckduckgo				##  Search Using The DuckDuckGo API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b qwant					##  Search Using The QWant API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b bing						##  Search Using The Bing API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b bingapi					##  Search Using The Bingapi API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b google					##  Search Using The Google API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b googleCSE				##  Search Using The Google API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b googleplus				##  Search Using The GooglePlus API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b google-profiles			##  Search Using The Google API
## ---------------------------------------------------------------------------------------------------------- ##


## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b urlscan					##  Search Using The URLScan API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b virustotal				##  Search Using The VirusTotal API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b threatcrowd				##  Search Using The ThreatCrowd API
## ---------------------------------------------------------------------------------------------------------- ##


## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b pgp					    ##  Search Using The PGP API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b twitter					##  Search Using The Twitter API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b linkedin					##  Search Using The LinkedIn API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b intelx					##  Search Using The Intelx API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b linkedin_links			##  Search Using The Linkedin_links API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b securityTrails			##  Search Using The SecurityTrails API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b pentesttools				##  Search Using The PentestTools API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b projectdiscovery		    ##  Search Using The ProjectDiscovery API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b rapiddns					##  Search Using The RapidDNS API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b baidu					##  Search Using The Baidu API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b omnisint					##  Search Using The Omnisint API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b otx						##  Search Using The OTX API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b exalead					##  Search Using The Exalead API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b bufferoverun				##  Search Using The BufferOverun API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b threatminer				##  Search Using The ThreatMiner API
## ---------------------------------------------------------------------------------------------------------- ##
		theHarvester -d $Domain -b trello					##  Search Using The Trello API
## ---------------------------------------------------------------------------------------------------------- ##
##
##
##-============================================================================================-##
##~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~##
##-============================================================================================-##
##
## ------------------------------------------------------------------------------------------------------------------ ##
		theHarvester -d $Domain --dns-lookup			## Perform A DNS Reverse Query on All Ranges Discovered
		theHarvester -d $Domain --dns-brute				## Perform A DNS Brute Force For The Domain Name
		theHarvester -d $Domain --dns-tld		        ## Perform A DNS TLD Expansion Discovery
		theHarvester -d $Domain --dns-server $DNS		## Specfic A DNS Server
		theHarvester -d $Domain --shodan		        ## Use SHODAN Database To Query Discovered Hosts
		theHarvester -d $Domain --google-dork			## Use Google Dorks for Google search
## ------------------------------------------------------------------------------------------------------------------ ##
##
##
##-============================================================================================-##
##~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~##
##-============================================================================================-##
##
## ----------------------------------------------------------------------------------------------------------------------- ##
	    theHarvester -d $Domain -l 50 -b google					## Limit the number of Google search results to 50
		theHarvester -d $Domain -l 50 -b bing					## Limit the number of Bing search results to 50
		theHarvester -d $Domain -l 50 -b linkedin				## Limit the number of LinkedIn search results to 50
		theharvester -d $Domain -b googleCSE -l 500 -s 300		## Limit 500 Queries, Start with result number 300
## ----------------------------------------------------------------------------------------------------------------------- ##
##
##-============================================================================================-##
##~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~##
##-============================================================================================-##
##



##-=====================================================-##
##   [+] Search Google for Domain - Limit 500 queries
##-=====================================================-##
theharvester -d $Domain -l 500 -b google --filename $Domain.html


##-=========================-##
##   [+] Harvester - Flags
##-=========================-##
theharvester -d $Domain -l $Limit -b $DataSource


##-=======================================-##
##   [+] Harvester Data Source - Twitter
##-=======================================-##
theharvester -d $Domain -l 500 -b twitter


##-===================================================-##
##   [+] Harvester Data Source - All Search Engines
##-===================================================-##
theharvester -d $Domain -l 500 -b all -b all


##-=======================================-##
##   [+] Harvester Data Source - Google
##-=======================================-##
theharvester -d $Domain -l 500 -b google
theharvester -d $Domain -b google > google.txt


##-=====================================================-##
##   [+] Use SHODAN Database To Query Discovered Hosts
##-=====================================================-##
theharvester -d $Domain -h > $Domain-SHODAN-Query.txt



