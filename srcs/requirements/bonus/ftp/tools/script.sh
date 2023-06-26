#!/bin/bash

service vsftpd start

# Add the USER, change his password and declare him as the owner of wordpress folder and all subfolders

adduser $USER_FTP --disabled-password

echo "$USER_FTP:$PWD_FTP" | /usr/sbin/chpasswd

echo "$USER_FTP" | tee -a /etc/vsftpd.userlist 

cat /etc/vsftpd.userlist 

mkdir /home/$USER_FTP/ftp


chown nobody:nogroup /home/$USER_FTP/ftp
chmod a-w /home/$USER_FTP/ftp

mkdir /home/$USER_FTP/ftp/files
chown $USER_FTP:$USER_FTP /home/$USER_FTP/ftp/files

sed -i -r "s/#write_enable=YES/write_enable=YES/1"   /etc/vsftpd.conf
sed -i -r "s/#chroot_local_user=YES/chroot_local_user=YES/1"   /etc/vsftpd.conf

echo "local_enable=YES"  >> /etc/vsftpd.conf
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
echo "pasv_enable=YES" >> /etc/vsftpd.conf
echo "local_root=/home/mbenbajj/ftp" >> /etc/vsftpd.conf
echo "pasv_min_port=40000" >> /etc/vsftpd.conf
echo "pasv_max_port=40005" >> /etc/vsftpd.conf
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf

service vsftpd stop

exec "$@"