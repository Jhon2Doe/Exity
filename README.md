<h1 align="center">
<b>Tor Relay interception</b>
</h1>


## >_ Introduction
**Exity** Tool to easy setup exit node relay environment. The `Deploy.sh` script contain all the possible techniques
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
  * configurare Exit Node Tor Relay 

## >_ Volumes
* `$(pwd)/data` logs dir.
* `$(pwd)/conf` configuration dir.

## >_ requirements
- Ubuntu Bionic Beaver (18.04 LTS)
- Git

## >_ provide documentation on:
- 5 Min installation steps
- Deploy and run the project
- Monitor interception by zeek


## >_ Installation Steps
Quickstart:
```shell
$ git clone https://github.com/Jhon2Doe/ExitNode.git
$ cd ExitNode
$ chmod +x Deploy.sh
$ bash Deploy.sh
```
Configuration:
You must configure `configurator.sh` script by modify `Nickname` change `###########` to your Alies. you can change `ExitPolicy` as you like. and `DirPort` `ORPort`
