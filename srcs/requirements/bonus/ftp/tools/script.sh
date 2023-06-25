#!/bin/bash

mkdir -p wordpress
chown nobody:nogroup wordpress

#to allow anonymous access
sed -i 's/anonymous_enable=NO/anonymous_enable=YES/g' /etc/vsftpd.conf

# to enable uploading
echo "write_enable=YES" >> /etc/vsftpd.conf
#to enable anonymous uploading
echo "anon_upload_enable=YES" >> /etc/vsftpd.conf
# to enable anonymous directory creation
echo "anon_mkdir_write_enable=YES" >> /etc/vsftpd.conf
#to enable anonymous deletion and renaming
echo "anon_other_write_enable=YES" >> /etc/vsftpd.conf
#sets the root folder for anonymous logins
echo "anon_root=/wordpress" >> /etc/vsftpd.conf
# stops prompting for a password on the command line.
echo "no_anon_password=YES" >> /etc/vsftpd.conf
# shows the user and group as ftp:ftp, regardless of the owner.
echo "hide_ids=YES" >> /etc/vsftpd.conf
# limits the range of ports that can be used for passive FTP
echo "pasv_min_port=40000" >> /etc/vsftpd.conf
echo "pasv_max_port=50000" >> /etc/vsftpd.conf
# echo "anon_umask=022" >> /etc/vsftpd.conf

service vsftpd start

exec "$@"