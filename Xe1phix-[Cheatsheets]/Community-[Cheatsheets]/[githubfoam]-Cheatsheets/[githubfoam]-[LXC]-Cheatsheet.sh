----------------------------------------------------------------------------------------------------------------
#LXD on ubuntu
#https://www.digitalocean.com/community/tutorials/how-to-set-up-and-use-lxd-on-ubuntu-16-04
sudo usermod --append --groups lxd vagrant
sudo apt-get update -y
sudo apt-get install zfsutils-linux -y
sudo lxd init
lxc list
lxc launch ubuntu:x webserver
lxc launch images:ubuntu/trusty myTrustyContainer -> download image and run container from downloaded image
lxc list
----------------------------------------------------------------------------------------------------------------
lxc exec webserver -- sudo --login --user ubuntu
lxc exec webserver -- /bin/bash --> connecting as root
sudo lxc exec my-alpine-container ls / -> execute command on running container
sudo lxc exec myfedoraContainer bash -> login to container
----------------------------------------------------------------------------------------------------------------
lxc help
lxc delete webserver

lxc stop webserver
lxc start webserver
----------------------------------------------------------------------------------------------------------------
#https://uk.images.linuxcontainers.org/
lxc launch images:centos/7 my-centos-container
lxc image list

sudo lxc remote list
sudo lxc image list images: amd64 ubuntu
sudo lxc image list images: amd64 alpine
"lxc image copy images:ubuntu/trusty local:" -> copy image to local repo

----------------------------------------------------------------------------------------------------------------
# nginx installation on ubuntu LXD container
 sudo apt-get update -y
 sudo apt-get install nginx
 sudo nano /var/www/html/index.nginx-debian.html
#logout and test nginx
curl http://10.163.135.40
----------------------------------------------------------------------------------------------------------------

#nginx installation on fedora LXD container
sudo lxc exec my-centos-container yum update
sudo lxc exec my-centos-container yum install epel-release
sudo lxc exec my-centos-container yum install nginx
sudo lxc exec my-centos-container systemctl start nginx
sudo lxc exec my-centos-container systemctl enable nginx
sudo lxc exec my-centos-container systemctl status nginx
sudo lxc exec my-centos-container vi /usr/share/nginx/html/index.html
curl http://10.248.210.112
----------------------------------------------------------------------------------------------------------------
