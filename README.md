
## ExitNode

To deploy tor server:

```bash
  sudo apt update
```

```bash
  sudo apt upgrade
```
```bash
  sudo apt install docker.io
```
```bash
  sudo docker pull blacktop/zeek
```
```bash
  mkdir data
```
```bash
  mkdir conf
```
- ADD sniffpass.zeek & local.zeek in conf folder

```bash
  sudo apt install nyx
```
change interface [eth0] and IP [172.105.0.1/16] in run-zeek.sh 
```bash
docker run --name zeek -d -v $(pwd)/data:/pcap -v $(pwd)/conf/sniffpass.zeek:/usr/local/zeek/share/zeek/myscripts/sniffpass.zeek -v $(pwd)/conf/local.zeek:/usr/local/zeek/share/zeek/site/local.zeek --net host blacktop/zeek -C -i eth0 local "Site::local_nets += { 172.105.0.1/16 }"
```
