<h1 align="center">
<b>Tor Relay interception</b>
</h1>

<img src="https://i.ibb.co/SB9jGnT/55555.png" align="right" height="100px" width="100px">

## >_ Introduction
**Exity** Tool to easy setup exit node relay environment. The `exity.sh` script contain all the possible techniques
  * Check if connected to Internet
  * Check OS Type
  * Check OS Release Version and Name
  * Check Architecture
  * Check Kernel Release
  * Check hostname
  * Check Internal IP & External IP
  * Check DNS
  * Check Logged In Users `Must be root`
  * Check RAM, SWAP and Disk Usages
  * Check System Uptime
  * Delete Temporary Files
  * Update OS package
  * upgrade OS package
  * install docker
  * pull & create zeek image
  * install tor and nyx

## >_ Volumes
* `$(pwd)/data` logs dir.
* `$(pwd)/conf` configuration dir.

## >_ requirements
- Ubuntu Bionic Beaver (18.04 LTS)
- Git

## >_ provide documentation on:
- 5 Min installation steps
- Deploy and run **Exity**


## >_ Installation Steps
Quickstart:
```shell
$ git clone https://github.com/Jhon2Doe/ExitNode.git
$ cd Exity
$ chmod +x exity.sh
$ bash exity.sh
```
* Configuration:
  - You must configure `configurator.sh` script by modify `Nickname` change `###########` to your Alies. 
  - you can change `DirPort` `ORPort` and `ExitPolicy`. allowing as many Internet services as possible.

```diff
+ ORPort 9001
- Nickname ###########
- ContactInfo (YOU EMAIL) [tor-relay.co]
Log notice file /var/log/tor/notices.log
+ DirPort 80
DirPortFrontPage /etc/tor/tor-exit-notice.html
ExitPolicy accept *:20-23     # FTP, SSH, telnet
ExitPolicy accept *:43        # WHOIS
ExitPolicy accept *:53        # DNS
ExitPolicy accept *:79-81     # finger, HTTP
ExitPolicy accept *:88        # kerberos
ExitPolicy accept *:110       # POP3
ExitPolicy accept *:143       # IMAP
ExitPolicy accept *:194       # IRC
ExitPolicy accept *:220       # IMAP3
ExitPolicy accept *:389       # LDAP
ExitPolicy accept *:443       # HTTPS
ExitPolicy accept *:464       # kpasswd
ExitPolicy accept *:465       # URD for SSM (more often: an alternative SUBMISSION port, see 587)
ExitPolicy accept *:531       # IRC/AIM
ExitPolicy accept *:543-544   # Kerberos
ExitPolicy accept *:554       # RTSP
ExitPolicy accept *:563       # NNTP over SSL
```
* run Tor Relay:
  - after editing `configurator.sh` script.
```shell
$ chmod +x configurator.sh
$ bash configurator.sh
```
