hostnamectl set-hostname songhong.com.vn
echo "
103.139.103.218 songhong.com.vn mail
" >>/etc/hosts 
sudo systemctl disable firewalld
sudo systemctl stop firewalld
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
yum install -y git  byobu bind-utils unzip net-tools sysstat openssh-clients perl-core libaio nmap-ncat libstdc++.so.6 nano wget

mkdir zimbra && cd zimbra

wget https://files.zimbra.com/downloads/8.8.15_GA/zcs-8.8.15_GA_3869.RHEL7_64.20190918004220.tgz
tar -xvf zcs-8.8.15_GA_3869.RHEL7_64.20190918004220.tgz
cd zcs-8.8.15_GA_3869.RHEL7_64.20190918004220
./install.sh
zmcontrol restart