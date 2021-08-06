#!/bin/bash 

# Check OS
cat /etc/os-release* |grep 'ubuntu' > /dev/null 2>&1 && OS='Ubuntu'
cat /etc/os-release* |grep 'centos' > /dev/null 2>&1 && OS='CentOS' 
echo $OS

# install_mariadb

if [ "$OS" == "CentOS" ]
then
    echo $OS
    yum install epel-release
    yum update -y
    yum install -y ssmtp

elif [ "$OS" == "Ubuntu" ]
then
    echo $OS
    apt-get update
    apt install ssmtp -y
else
    echo none
fi
cp /etc/ssmtp/ssmtp.conf /etc/ssmtp/ssmtp.conf.bak

read -p "SMTP server:(Enter for: smtp.gmail.com): " smtpserver
read -p "SMTP Username (Ex: user@gmail.com): " smtpuser
read -p "SMTP Password (password for $smtpuser): " smtppassword
read -p "SMTP port:(Enter for: 587): " smtpport
if [ $smtpserver="" ]
then 
    smtpserver=smtp.gmail.com
fi 

if [ $smtpport="" ]
then 
    smtpport=587
fi 
echo "
root=$smtpuser
mailhub=smtp.gmail.com:587
AuthUser=$smtpuser
AuthPass=$smtppassword
UseTLS=YES
UseSTARTTLS=YES
rewriteDomain=gmail.com
FromLineOverride=YES
" > /etc/ssmtp/ssmtp.conf

echo " 
root:$smtpuser:smtp.gmail.com:587
" >> /etc/ssmtp/revaliases
sleep 5
echo "Install thành công SSMTP."