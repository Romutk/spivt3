#/bin/bash

# новый пользователь и пароль
useradd webmaster
passwd webmaster


# SELinux пользователь
semanage user -a -R "staff_r system_r webadm_r" -L s0 -r s0 webadm_u

#связываем SELinux пользователя с польователем в системе
semanage login -a -r s0 -s webadm_u webmaster

#копируем шаблон
cp /etc/selinux/targeted/contexts/users/staff_u /etc/selinux/targeted/contexts/users/webadm_u

# добавляем правило
echo 'webmaster ALL=(ALL) TYPE=webadm_t ROLE=webadm_r ALL' > /etc/sudoers.d/webmaster

