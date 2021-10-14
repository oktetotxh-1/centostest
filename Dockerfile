FROM centos
RUN yum update -y
RUN DEBIAN_FRONTEND=noninteractive yum install openssh-server wget npm -y
RUN npm install -g wstunnel
RUN mkdir /run/sshd 
RUN echo 'wstunnel -s 0.0.0.0:80 &' >>/runstart.sh
RUN echo '/usr/sbin/sshd -D' >>/runstart.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:tixiaohan|chpasswd
RUN chmod 755 /runstart.sh
EXPOSE 80
CMD  /runstart.sh
