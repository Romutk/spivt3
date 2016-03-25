#/bin/bash

useradd webmaster
passwd webmaster


semanage login -a -s staff_u  webmaster 
semanage user -m -R 'staff_r webadm_r system_r' staff_u
echo 'webmaster ALL=(ALL) TYPE=webadm_t ROLE=webadm_r ALL' > /etc/sudoers.d/webmaster  



