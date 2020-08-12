FROM vitotp/centos7.6
MAINTAINER Hogen

# 安装ssh
RUN yum install passwd openssl openssh-server -y 
RUN ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key  -N ''
RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config
RUN sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config
RUN echo "root:root123" | chpasswd

# 复制一键sh
COPY ./onekey/ /root/onekey/

# 清除yum缓存
RUN yum clean all
RUN rm -rf /var/cache/yum/*

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
