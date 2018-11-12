cat ~/.ssh/id_rsa.pub | pssh -h /home/najite/ips.txt -l root -A -I -i -O StrictHostKeyChecking=no 'umask 077; mkdir -p ~/.ssh; afile=~/.ssh/authorized_keys; cat - >> $afile; sort -u $afile -o $afile'
