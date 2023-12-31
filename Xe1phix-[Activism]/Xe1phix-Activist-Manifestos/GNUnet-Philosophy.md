## GNUnet-Philosophy.md


The foremost goal of the GNUnet project is to become a widely used, reliable, open, non-discriminating, egalitarian, unfettered and censorship-resistant system of free information exchange. We value free speech above state secrets, law-enforcement or intellectual monopoly. GNUnet is supposed to be an anarchistic network, where the only limitation for peers is that they must contribute enough back to the network such that their resource consumption does not have a significant impact on other users. GNUnet should be more than just another file-sharing network. The plan is to offer many other services and in particular to serve as a development platform for the next generation of decentralized Internet protocols.
Copyright and Contributions

    Deutsch
    Français
    Italiano
    Suomi
    Português
    Español

GNUnet is a GNU package. All code contributions must thus be put under the GNU Public License (GPL). All documentation should be put under FSF approved licenses (see fdl).

By submitting documentation, translations, comments and other content to this website you automatically grant the right to publish code under the GNU Public License and documentation under either or both the GNU Public License or the GNU Free Documentation License. When contributing to the GNUnet project, GNU standards and the GNU philosophy should be adhered to.

Note that we do now require a formal copyright assignment for GNUnet, however, we do still allow pseudonymous contributions. However, by submitting your code (or documentation) to us you clearly agree to share the rights to your code with GNUnet e.V. GNUnet e.V. receives non-exclusive ownership rights, and in particular is allowed to dual-license the code. You retain non-exclusive rights to your contributions, so you can also share your contributions freely with other projects.

GNUnet e.V. will publish all accepted contributions under the GPLv3 or any later version. The association may decide to publish contributions under additional licenses (dual-licensing).

We do not intentionally remove your name from your contributions; however, due to extensive editing it is not always trivial to attribute contributors properly. If you find that you significantly contributed to a file (or the project as a whole) and are not listed in the respective authors file or section, please do let us know.
Design Goals

    Suomi
    Français
    Deutsch
    Español

The foremost goal of the GNUnet project is to become a widely used, reliable, open, non-discriminating, egalitarian, unfettered and censorship-resistant system of free information exchange. We value free speech above state secrets, law-enforcement or intellectual property. GNUnet is supposed to be an anarchistic network, where the only limitation for peers is that they must contribute enough back to the network such that their resource consumption does not have a significant impact on other users. GNUnet should be more than just another file-sharing network. The plan is to offer many other services and in particular to serve as a development platform for the next generation of decentralized Internet protocols.

Security & Privacy

GNUnet's primary design goals are to protect the privacy of its users and to guard itself against attacks or abuse. GNUnet does not have any mechanisms to control, track or censor users. Instead, the GNUnet protocols aim to make it as hard as possible to find out what is happening on the network or to disrupt operations.

Versatility

We call GNUnet a peer-to-peer framework because we want to support many different forms of peer-to-peer applications. GNUnet uses a plugin architecture to make the system extensible and to encourage code reuse. While the first versions of the system only supported anonymous file-sharing, other applications are being worked on and more will hopefully follow in the future. A powerful synergy regarding anonymity services is created by a large community utilizing many diverse applications over the same software infrastructure. The reason is that link encryption hides the specifics of the traffic for non-participating observers. This way, anonymity can get stronger with additional (GNUnet) traffic, even if the additional traffic is not related to anonymous communication. Increasing anonymity is the primary reason why GNUnet is developed to become a peer-to-peer framework where many applications share the lower layers of an increasingly complex protocol stack. If merging traffic to hinder traffic analysis was not important, we could have just developed a dozen stand-alone applications and a few shared libraries.

Practicality

GNUnet allows participants to trade various amounts of security in exchange for increased efficiency. However, it is not possible for any user's security and efficiency requirements to compromise the security and efficiency of any other user.

For GNUnet, efficiency is not paramount. If there is a more secure and still practical approach, we would choose to take the more secure alternative. telnet is more efficient than ssh, yet it is obsolete. Hardware gets faster, and code can be optimized. Fixing security issues as an afterthought is much harder.

While security is paramount, practicability is still a requirement. The most secure system is always the one that nobody can use. Similarly, any anonymous system that is extremely inefficient will only find few users. However, good anonymity requires a large and diverse user base. Since individual security requirements may vary, the only good solution here is to allow individuals to trade-off security and efficiency. The primary challenge in allowing this is to ensure that the economic incentives work properly. In particular, this means that it must be impossible for a user to gain security at the expense of other users. Many designs (e.g. anonymity via broadcast) fail to give users an incentive to choose a less secure but more efficient mode of operation. GNUnet should avoid where ever possible to rely on protocols that will only work if the participants are benevolent. While some designs have had widespread success while relying on parties to observe a protocol that may be sub-optimal for the individuals (e.g. TCP Nagle), a protocol that ensures that individual goals never conflict with the goals of the group is always preferable.
Key Concepts

    Deutsch
    Español
    Français

In this section, the fundamental concepts of GNUnet are explained. Most of them are also described in our research papers. First, some of the concepts used in the GNUnet framework are detailed. The second part describes concepts specific to anonymous file-sharing.
Authentication

Almost all peer-to-peer communications in GNUnet are between mutually authenticated peers. The authentication works by using ECDHE, that is a DH key exchange using ephemeral eliptic curve cryptography. The ephemeral ECC keys are signed using ECDSA. The shared secret from ECDHE is used to create a pair of session keys (using HKDF) which are then used to encrypt the communication between the two peers using both 256-bit AES and 256-bit Twofish (with independently derived secret keys). As only the two participating hosts know the shared secret, this authenticates each packet without requiring signatures each time. GNUnet uses SHA-512 hash codes to verify the integrity of messages.

In GNUnet, the identity of a host is its public key. For that reason, man-in-the-middle attacks will not break the authentication or accounting goals. Essentially, for GNUnet, the IP of the host has nothing to do with the identity of the host. As the public key is the only thing that truly matters, faking an IP, a port or any other property of the underlying transport protocol is irrelevant. In fact, GNUnet peers can use multiple IPs (IPv4 and IPv6) on multiple ports --- or even not use the IP protocol at all (by running directly on layer 2).

GNUnet uses a special type of message to communicate a binding between public (ECC) keys to their current network address. These messages are commonly called HELLOs or peer advertisements. They contain the public key of the peer and its current network addresses for various transport services. A transport service is a special kind of shared library that provides (possibly unreliable, out-of-order) message delivery between peers. For the UDP and TCP transport services, a network address is an IP and a port. GNUnet can also use other transports (HTTP, HTTPS, WLAN, etc.) which use various other forms of addresses. Note that any node can have many different active transport services at the same time, and each of these can have a different addresses. Binding messages expire after at most a week (the timeout can be shorter if the user configures the node appropriately). This expiration ensures that the network will eventually get rid of outdated advertisements.
More details can be found in this paper.
Accounting to Encourage Resource Sharing

Most distributed P2P networks suffer from a lack of defenses or precautions against attacks in the form of freeloading. While the intentions of an attacker and a freeloader are different, their effect on the network is the same; they both render it useless. Most simple attacks on networks such as Gnutella involve flooding the network with traffic, particularly with queries that are, in the worst case, multiplied by the network.

In order to ensure that freeloaders or attackers have a minimal impact on the network, GNUnet's file-sharing implementation tries to distinguish good (contributing) nodes from malicious (freeloading) nodes. In GNUnet, every file-sharing node keeps track of the behavior of every other node it has been in contact with. Many requests (depending on the application) are transmitted with a priority (or importance) level. That priority is used to establish how important the sender believes this request is. If a peer responds to an important request, the recipient will increase its trust in the responder: the responder contributed resources. If a peer is too busy to answer all requests, it needs to prioritize. For that, peers to not take the priorities of the requests received at face value. First, they check how much they trust the sender, and depending on that amount of trust they assign the request a (possibly lower) effective priority. Then, they drop the requests with the lowest effective priority to satisfy their resource constraints. This way, GNUnet's economic model ensures that nodes that are not currently considered to have a surplus in contributions will not be served if the network load is high. More details can be found in this paper.
Confidentiality

Adversaries outside of GNUnet are not supposed to know what kind of actions a peer is involved in. Only the specific neighbor of a peer that is the corresponding sender or recipient of a message may know its contents, and even then application protocols may place further restrictions on that knowledge. In order to ensure confidentiality, GNUnet uses link encryption, that is each message exchanged between two peers is encrypted using a pair of keys only known to these two peers. Encrypting traffic like this makes any kind of traffic analysis much harder. Naturally, for some applications, it may still be desirable if even neighbors cannot determine the concrete contents of a message. In GNUnet, this problem is addressed by the specific application-level protocols (see for example, deniability and anonymity in anonymous file sharing).
Anonymity

Providing anonymity for users is the central goal for the anonymous file-sharing application. Many other design decisions follow in the footsteps of this requirement. Anonymity is never absolute. While there are various scientific metrics that can help quantify the level of anonymity that a given mechanism provides, there is no such thing as complete anonymity. GNUnet's file-sharing implementation allows users to select for each operation (publish, search, download) the desired level of anonymity. The metric used is the amount of cover traffic available to hide the request. While this metric is not as good as, for example, the theoretical metric given in scientific metrics, it is probably the best metric available to a peer with a purely local view of the world that does not rely on unreliable external information. The default anonymity level is 1, which uses anonymous routing but imposes no minimal requirements on cover traffic. It is possible to forego anonymity when this is not required. The anonymity level of 0 allows GNUnet to use more efficient, non-anonymous routing.
How GNUnet achieves Anonymity

Contrary to other designs, we do not believe that users achieve strong anonymity just because their requests are obfuscated by a couple of indirections. This is not sufficient if the adversary uses traffic analysis. The threat model used for anonymous file sharing in GNUnet assumes that the adversary is quite powerful. In particular, we assume that the adversary can see all the traffic on the Internet. And while we assume that the adversary can not break our encryption, we assume that the adversary has many participating nodes in the network and that it can thus see many of the node-to-node interactions since it controls some of the nodes.

The system tries to achieve anonymity based on the idea that users can be anonymous if they can hide their actions in the traffic created by other users. Hiding actions in the traffic of other users requires participating in the traffic, bringing back the traditional technique of using indirection and source rewriting. Source rewriting is required to gain anonymity since otherwise an adversary could tell if a message originated from a host by looking at the source address. If all packets look like they originate from a node, the adversary can not tell which ones originate from that node and which ones were routed. Note that in this mindset, any node can decide to break the source-rewriting paradigm without violating the protocol, as this only reduces the amount of traffic that a node can hide its own traffic in.

If we want to hide our actions in the traffic of other nodes, we must make our traffic indistinguishable from the traffic that we route for others. As our queries must have us as the receiver of the reply (otherwise they would be useless), we must put ourselves as the receiver of replies that actually go to other hosts; in other words, we must indirect replies. Unlike other systems, in anonymous file-sharing as implemented on top of GNUnet we do not have to indirect the replies if we don't think we need more traffic to hide our own actions.
This increases the efficiency of the network as we can indirect less under higher load. More details can be found in this paper.

Deniability

Even if the user that downloads data and the server that provides data are anonymous, the intermediaries may still be targets. In particular, if the intermediaries can find out which queries or which content they are processing, a strong adversary could try to force them to censor certain materials.

With the file-encoding used by GNUnet's anonymous file-sharing, this problem does not arise. The reason is that queries and replies are transmitted in an encrypted format such that intermediaries cannot tell what the query is for or what the content is about. Mind that this is not the same encryption as the link-encryption between the nodes. GNUnet has encryption on the network layer (link encryption, confidentiality, authentication) and again on the application layer (provided by gnunet-publish, gnunet-download, gnunet-search and gnunet-gtk). More details can be found here.
Peer Identities

Peer identities are used to identify peers in the network and are unique for each peer. The identity for a peer is simply its public key, which is generated along with a private key the peer is started for the first time. While the identity is binary data, it is often expressed as ASCII string. For example, the following is a peer identity as you might see it in various places:

UAT1S6PMPITLBKSJ2DGV341JI6KF7B66AC4JVCN9811NNEGQLUN0

You can find your peer identity by running

$ gnunet-peerinfo -s
Zones in the GNU Name System (GNS Zones)

GNS zones are similar to those of DNS zones, but instead of a hierarchy of authorities to governing their use, GNS zones are controlled by a private key. When you create a record in a DNS zone, that information stored in your nameserver. Anyone trying to resolve your domain then gets pointed (hopefully) by the centralised authority to your nameserver. Whereas GNS, being decentralised by design, stores that information in DHT. The validity of the records is assured cryptographically, by signing them with the private key of the respective zone.

Anyone trying to resolve records in a zone your domain can then verify the signature on the records they get from the DHT and be assured that they are indeed from the respective zone. To make this work, there is a 1:1 correspondence between zones and their public-private key pairs. So when we talk about the owner of a GNS zone, that's really the owner of the private key. And a user accessing a zone needs to somehow specify the corresponding public key first.
Egos

Egos are your "identities" in GNUnet. Any user can assume multiple identities, for example to separate his activities online. Egos can correspond to pseudonyms or real-world identities. Technically, an ego is first of all a public-private key pair, and thus egos also always correspond to a GNS zone. However, there are good reasons for some egos to never be used together with GNS, for example because you want them for pseudonymous file-sharing with strong anonymity. Egos are managed by the IDENTITY service. Note that this service has nothing to do with the peer identity. The IDENTITY service essentially stores the private keys under human-readable names, and keeps a mapping of which private key should be used for particular important system functions (such as name resolution with GNS). If you follow the GNUnet setup, you will have 4 egos created by default. They can be listed by the command

$ gnunet-identity -d
short-zone - JTDVJC69NHU6GQS4B5721MV8VM7J6G2DVRGJV0ONIT6QH7OI6D50
sks-zone - GO0T87F9BPMF8NKD5A54L2AH1T0GRML539TPFSRMCEA98182QD30
master-zone - LOC36VTJD3IRULMM6C20TGE6D3SVEAJOHI9KRI5KAQVQ87UJGPJG
private-zone - 6IGJIU0Q1FO3RJT57UJRS5DLGLH5IHRB9K2L3DO4P4GVKKJ0TN4G

These egos and their usage is descibed here.

Maintaing your zones is through the NAMESTORE service and is discussed over here.
Backup of Identities, Egos

One should always backup their files, especially in these SSD days (our team has suffered 3 SSD crashes over a span of 2 weeks). Backing up peer identity and zones is achieved by copying the following files:

The peer identity file can be found in ~/.local/share/gnunet/private_key.ecc

The private keys of your egos are stored in the directory ~/.local/share/gnunet/identity/egos/. They are stored in files whose filenames correspond to the zones' ego names. These are probably the most important files you want to backup from a GNUnet installation.

Note: All these files contain cryptographic keys and they are stored without any encryption. So it is advisable to backup encrypted copies of them.
Revocation

Now, in the situation of an attacker gaining access to the private key of one of your egos, the attacker can create records in the respective GNS zone and publish them as if you published them. Anyone resolving your domain will get these new records and when they verify they seem authentic because the attacker has signed them with your key.

To address this potential security issue, you can pre-compute a revocation certificate corresponding to your ego. This certificate, when published on the P2P network, flags your private key as invalid, and all further resolutions or other checks involving the key will fail.

A revocation certificate is thus a useful tool when things go out of control, but at the same time it should be stored securely. Generation of the revocation certificate for a zone can be done through gnunet-revocation. For example, the following commands generates a revocation file revocation.dat for the zone zone1:

$ gnunet-revocation -f revocation.dat -R zone1

The above command only pre-computes a revocation certificate. It does not revoke the given zone. Pre-computing a revocation certificate involves computing a proof-of-work and hence may take upto 4 to 5 days on a modern processor. Note that you can abort and resume the calculation at any time. Also, even if you did not finish the calculation, the resulting file willl contain the signature, which is sufficient to complete the revocation process even without access to the private key. So instead of waiting for a few days, you can just abort with CTRL-C, backup the revocation certificate and run the calculation only if your key actually was compromised. This has the disadvantage of revocation taking longer after the incident, but the advantage of saving a significant amount of energy. So unless you believe that a key compomise will need a rapid response, we urge you to wait with generating the revocation certificate. Also, the calculation is deliberately expensive, to deter people from doing this just for fun (as the actual revocation operation is expensive for the network, not for the peer performing the revocation).

To avoid TL;DR ones from accidentally revocating their zones, I am not giving away the command, but its simple: the actual revocation is performed by using the -p option of gnunet-revocation.

