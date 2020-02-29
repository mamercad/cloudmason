
#!/usr/bin/env bash
yum install -y gcc make perl bzip2 kernel-devel-$(uname -r)
mount -t iso9660 -o loop /root/VBoxGuestAdditions.iso /mnt
/mnt/VBoxLinuxAdditions.run
cat /var/log/vboxadd-install.log
rm -f /var/log/vboxadd-install*.log
rm -f /var/log/VBoxGuestAdditions.log
umount /mnt
rm -f /root/VBoxGuestAdditions.iso
