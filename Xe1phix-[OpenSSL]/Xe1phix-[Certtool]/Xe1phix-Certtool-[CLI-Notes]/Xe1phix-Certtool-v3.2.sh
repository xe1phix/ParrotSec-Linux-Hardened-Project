#!/bin/sh
##
##-============================-## 
## ------------------------------------------------- ##
##                  Xe1phix-Certtool.sh
## ------------------------------------------------- ##
##-============================-## 
## 
## Xe1phix-Certtool-v2.3.sh

## Generating private keys

## To create an RSA private key, run:

certtool --generate-privkey --outfile key.pem --rsa

## To create a DSA or elliptic curves (ECDSA) private key use the above command combined with ’dsa’ or ’ecc’ options.
## Generating certificate requests

## To create a certificate request (needed when the certificate is issued by another party), run:

certtool --generate-request --load-privkey key.pem --outfile request.pem

## If the private key is stored in a smart card you can generate a request 
## by specifying the private key object URL.

./certtool --generate-request --load-privkey "pkcs11:..."  --load-pubkey "pkcs11:..." --outfile request.pem

## Generating a self-signed certificate

## To create a self signed certificate, use the command:

certtool --generate-privkey --outfile ca-key.pem
certtool --generate-self-signed --load-privkey ca-key.pem  --outfile ca-cert.pem

## Note that a self-signed certificate usually belongs to a certificate authority, 
## that signs other certificates.

## Generating a certificate

## To generate a certificate using the previous request, use the command:

certtool --generate-certificate --load-request request.pem  --outfile cert.pem --load-ca-certificate ca-cert.pem  --load-ca-privkey ca-key.pem


## To generate a certificate using the private key only, use the command:

certtool --generate-certificate --load-privkey key.pem  --outfile cert.pem --load-ca-certificate ca-cert.pem  --load-ca-privkey ca-key.pem

## Certificate information

## view the certificate information:

certtool --certificate-info --infile cert.pem

## PKCS #12 structure generation

## To generate a PKCS #12 structure using the previous key  and certificate, use the command:

certtool --load-certificate cert.pem --load-privkey key.pem --to-p12 --outder --outfile key.p12

## Some tools (reportedly web browsers) have problems with that file 
## because it does not contain the CA certificate for the certificate. 
## To work around that problem in the tool, 
## you can use the –load-ca-certificate parameter as follows:

certtool --load-ca-certificate ca.pem --load-certificate cert.pem --load-privkey key.pem --to-p12 --outder --outfile key.p12

## Obtaining Diffie-Hellman parameters

## To obtain the RFC7919 parameters for Diffie-Hellman key exchange, use the command:

certtool --get-dh-params --outfile dh.pem --sec-param medium

## Verifying a certificate

## verify a certificate in a file against the system’s CA trust store use the following command:

certtool --verify --infile cert.pem

## simulate hostname verification with the following options:

certtool --verify --verify-hostname www.example.com --infile cert.pem

## Proxy certificate generation

## Proxy certificate can be used to delegate your credential to a temporary, 
typically short-lived, certificate. 
To create one from the previously created certificate, 
first create a temporary key 
and then generate a proxy certificate for it, 
using the commands:

certtool --generate-privkey > proxy-key.pem
certtool --generate-proxy --load-ca-privkey key.pem  --load-privkey proxy-key.pem --load-certificate cert.pem  --outfile proxy-cert.pem

## Certificate revocation list generation

## To create an empty Certificate Revocation List (CRL) do:

certtool --generate-crl --load-ca-privkey x509-ca-key.pem --load-ca-certificate x509-ca.pem

## To create a CRL that contains some revoked certificates, 
## place the certificates in a file and use --load-certificate as follows:

certtool --generate-crl --load-ca-privkey x509-ca-key.pem --load-ca-certificate x509-ca.pem --load-certificate revoked-certs.pem

## To verify a Certificate Revocation List (CRL) do:

certtool --verify-crl --load-ca-certificate x509-ca.pem < crl.pem

## certtool Files
## Certtool’s template file format

## A template file can be used to avoid the interactive questions of certtool. 
## Initially create a file named ’cert.cfg’ that contains the information about the certificate. 
## The template can be used as below:

certtool --generate-certificate --load-privkey key.pem --template cert.cfg --outfile cert.pem --load-ca-certificate ca-cert.pem --load-ca-privkey ca-key.pem

## An example certtool template file that can be used to 
## generate a certificate request or a self signed certificate follows.







# X.509 Certificate options
#
# DN options

# The organization of the subject.
organization = "Koko inc."

# The organizational unit of the subject.
unit = "sleeping dept."

# The locality of the subject.
# locality =

# The state of the certificate owner.
state = "Attiki"

# The country of the subject. Two letter code.
country = GR

# The common name of the certificate owner.
cn = "Cindy Lauper"

# A user id of the certificate owner.
#uid = "clauper"

# Set domain components
#dc = "name"
#dc = "domain"

# If the supported DN OIDs are not adequate you can set
# any OID here.
# For example set the X.520 Title and the X.520 Pseudonym
# by using OID and string pairs.
#dn_oid = "2.5.4.12 Dr."
#dn_oid = "2.5.4.65 jackal"

# This is deprecated and should not be used in new
# certificates.
# pkcs9_email = "none@none.org"

# An alternative way to set the certificate's distinguished name directly
# is with the "dn" option. The attribute names allowed are:
# C (country), street, O (organization), OU (unit), title, CN (common name),
# L (locality), ST (state), placeOfBirth, gender, countryOfCitizenship, 
# countryOfResidence, serialNumber, telephoneNumber, surName, initials, 
# generationQualifier, givenName, pseudonym, dnQualifier, postalCode, name, 
# businessCategory, DC, UID, jurisdictionOfIncorporationLocalityName, 
# jurisdictionOfIncorporationStateOrProvinceName,
# jurisdictionOfIncorporationCountryName, XmppAddr, and numeric OIDs.

#dn = "cn = Nikos,st = New\, Something,C=GR,surName=Mavrogiannopoulos,2.5.4.9=Arkadias"

# The serial number of the certificate
# The value is in decimal (i.e. 1963) or hex (i.e. 0x07ab).
# Comment the field for a random serial number.
serial = 007

# In how many days, counting from today, this certificate will expire.
# Use -1 if there is no expiration date.
expiration_days = 700

# Alternatively you may set concrete dates and time. The GNU date string 
# formats are accepted. See:
# http://www.gnu.org/software/tar/manual/html_node/Date-input-formats.html

#activation_date = "2004-02-29 16:21:42"
#expiration_date = "2025-02-29 16:24:41"

# X.509 v3 extensions

# A dnsname in case of a WWW server.
#dns_name = "www.none.org"
#dns_name = "www.morethanone.org"

# An othername defined by an OID and a hex encoded string
#other_name = "1.3.6.1.5.2.2 302ca00d1b0b56414e5245494e2e4f5247a11b3019a006020400000002a10f300d1b047269636b1b0561646d696e"
#other_name_utf8 = "1.2.4.5.6 A UTF8 string"
#other_name_octet = "1.2.4.5.6 A string that will be encoded as ASN.1 octet string"

# Allows writing an XmppAddr Identifier
#xmpp_name = juliet@im.example.com

# Names used in PKINIT
#krb5_principal = user@REALM.COM
#krb5_principal = HTTP/user@REALM.COM

# A subject alternative name URI
#uri = "http://www.example.com"

# An IP address in case of a server.
#ip_address = "192.168.1.1"

# An email in case of a person
email = "none@none.org"

# TLS feature (rfc7633) extension. That can is used to indicate mandatory TLS
# extension features to be provided by the server. In practice this is used
# to require the Status Request (extid: 5) extension from the server. That is,
# to require the server holding this certificate to provide a stapled OCSP response.
# You can have multiple lines for multiple TLS features.

# To ask for OCSP status request use:
#tls_feature = 5

# Challenge password used in certificate requests
challenge_password = 123456

# Password when encrypting a private key
#password = secret

# An URL that has CRLs (certificate revocation lists)
# available. Needed in CA certificates.
#crl_dist_points = "http://www.getcrl.crl/getcrl/"

# Whether this is a CA certificate or not
#ca

# Subject Unique ID (in hex)
#subject_unique_id = 00153224

# Issuer Unique ID (in hex)
#issuer_unique_id = 00153225

#### Key usage

# The following key usage flags are used by CAs and end certificates

# Whether this certificate will be used to sign data (needed
# in TLS DHE ciphersuites). This is the digitalSignature flag
# in RFC5280 terminology.
signing_key

# Whether this certificate will be used to encrypt data (needed
# in TLS RSA ciphersuites). Note that it is preferred to use different
# keys for encryption and signing. This is the keyEncipherment flag
# in RFC5280 terminology.
encryption_key

# Whether this key will be used to sign other certificates. The
# keyCertSign flag in RFC5280 terminology.
#cert_signing_key

# Whether this key will be used to sign CRLs. The
# cRLSign flag in RFC5280 terminology.
#crl_signing_key

# The keyAgreement flag of RFC5280. It's purpose is loosely
# defined. Not use it unless required by a protocol.
#key_agreement

# The dataEncipherment flag of RFC5280. It's purpose is loosely
# defined. Not use it unless required by a protocol.
#data_encipherment

# The nonRepudiation flag of RFC5280. It's purpose is loosely
# defined. Not use it unless required by a protocol.
#non_repudiation

#### Extended key usage (key purposes)

# The following extensions are used in an end certificate
# to clarify its purpose. Some CAs also use it to indicate
# the types of certificates they are purposed to sign.


# Whether this certificate will be used for a TLS client;
# this sets the id-kp-serverAuth (1.3.6.1.5.5.7.3.1) of 
# extended key usage.
#tls_www_client

# Whether this certificate will be used for a TLS server;
# This sets the id-kp-clientAuth (1.3.6.1.5.5.7.3.2) of 
# extended key usage.
#tls_www_server

# Whether this key will be used to sign code. This sets the
# id-kp-codeSigning (1.3.6.1.5.5.7.3.3) of extended key usage
# extension.
#code_signing_key

# Whether this key will be used to sign OCSP data. This sets the
# id-kp-OCSPSigning (1.3.6.1.5.5.7.3.9) of extended key usage extension.
#ocsp_signing_key

# Whether this key will be used for time stamping. This sets the
# id-kp-timeStamping (1.3.6.1.5.5.7.3.8) of extended key usage extension.
#time_stamping_key

# Whether this key will be used for email protection. This sets the
# id-kp-emailProtection (1.3.6.1.5.5.7.3.4) of extended key usage extension.
#email_protection_key

# Whether this key will be used for IPsec IKE operations (1.3.6.1.5.5.7.3.17).
#ipsec_ike_key

## adding custom key purpose OIDs

# for microsoft smart card logon
# key_purpose_oid = 1.3.6.1.4.1.311.20.2.2

# for email protection
# key_purpose_oid = 1.3.6.1.5.5.7.3.4

# for any purpose (must not be used in intermediate CA certificates)
# key_purpose_oid = 2.5.29.37.0

### end of key purpose OIDs

### Adding arbitrary extensions
# This requires to provide the extension OIDs, as well as the extension data in
# hex format. The following two options are available since GnuTLS 3.5.3.
#add_extension = "1.2.3.4 0x0AAB01ACFE"

# As above but encode the data as an octet string
#add_extension = "1.2.3.4 octet_string(0x0AAB01ACFE)"

# For portability critical extensions shouldn't be set to certificates.
#add_critical_extension = "5.6.7.8 0x1AAB01ACFE"

# When generating a certificate from a certificate
# request, then honor the extensions stored in the request
# and store them in the real certificate.
#honor_crq_extensions

# Alternatively only specific extensions can be copied.
#honor_crq_ext = 2.5.29.17
#honor_crq_ext = 2.5.29.15

# Path length contraint. Sets the maximum number of
# certificates that can be used to certify this certificate.
# (i.e. the certificate chain length)
#path_len = -1
#path_len = 2

# OCSP URI
# ocsp_uri = http://my.ocsp.server/ocsp

# CA issuers URI
# ca_issuers_uri = http://my.ca.issuer

# Certificate policies
#policy1 = 1.3.6.1.4.1.5484.1.10.99.1.0
#policy1_txt = "This is a long policy to summarize"
#policy1_url = http://www.example.com/a-policy-to-read

#policy2 = 1.3.6.1.4.1.5484.1.10.99.1.1
#policy2_txt = "This is a short policy"
#policy2_url = http://www.example.com/another-policy-to-read

# The number of additional certificates that may appear in a
# path before the anyPolicy is no longer acceptable.
#inhibit_anypolicy_skip_certs 1

# Name constraints

# DNS
#nc_permit_dns = example.com
#nc_exclude_dns = test.example.com

# EMAIL
#nc_permit_email = "nmav@ex.net"

# Exclude subdomains of example.com
#nc_exclude_email = .example.com

# Exclude all e-mail addresses of example.com
#nc_exclude_email = example.com

# IP
#nc_permit_ip = 192.168.0.0/16
#nc_exclude_ip = 192.168.5.0/24
#nc_permit_ip = fc0a:eef2:e7e7:a56e::/64


# Options for proxy certificates
#proxy_policy_language = 1.3.6.1.5.5.7.21.1


# Options for generating a CRL

# The number of days the next CRL update will be due.
# next CRL update will be in 43 days
#crl_next_update = 43

# this is the 5th CRL by this CA
# The value is in decimal (i.e. 1963) or hex (i.e. 0x07ab).
# Comment the field for a time-based number.
# Time-based CRL numbers generated in GnuTLS 3.6.3 and later
# are significantly larger than those generated in previous
# versions. Since CRL numbers need to be monotonic, you need
# to specify the CRL number here manually if you intend to
# downgrade to an earlier version than 3.6.3 after publishing
# the CRL as it is not possible to specify CRL numbers greater
# than 2**63-2 using hex notation in those versions.
#crl_number = 5

# Specify the update dates more precisely.
#crl_this_update_date = "2004-02-29 16:21:42"
#crl_next_update_date = "2025-02-29 16:24:41"

# The date that the certificates will be made seen as
# being revoked.
#crl_revocation_date = "2025-02-29 16:24:41"


