install
url --url="http://mirrors.umflint.edu/centos/8/BaseOS/x86_64/os"
eula --agreed
reboot

ignoredisk --only-use=sda
autopart --type=lvm
clearpart --none --initlabel
text
keyboard --vckeymap=us --xlayouts='us'
lang en_US.UTF-8

network  --bootproto=dhcp --device=enp0s3 --ipv6=auto --activate
network  --hostname=vagrant.localdomain
rootpw --iscrypted $6$qHNq.MRZQDC7Tzkv$ECo9ZV61sqWgaV3F3eGc6jQS/ix5TyAIHGFIiYleMCdB7v2ZQeE7F3SlgYwfZhACxQLObY.KYDc3Kb/Uhm7RN.
firstboot --enable
skipx
services --enabled="chronyd"
timezone America/New_York --isUtc
user --groups=wheel --name=vagrant --password=$6$q1ji0sw1iy/rK3vI$vGm1opC6XK15vUrFs4yd7sLBcAbniDFIEHfWBeeYvNrEyLakghz1FNZNm2vxFLCHuPJZzOI/rfa6jKCX30eyi1 --iscrypted --gecos="vagrant"

%packages
@^minimal-environment
@headless-management
kexec-tools
%end

%addon com_redhat_kdump --enable --reserve-mb='auto'
%end

%anaconda
pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
%end

%post
echo "vagrant ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers.d/vagrant
(
  mkdir /home/vagrant/.ssh
  chmod 0700 /home/vagrant/.ssh
  cd /home/vagrant/.ssh
  echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key" > authorized_keys
  chmod 0600 authorized_keys
  chown vagrant:vagrant authorized_keys
  cd /home/vagrant
  chown vagrant:vagrant /home/vagrant/.ssh
)
%end
