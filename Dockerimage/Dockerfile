FROM centos:7
MAINTAINER Dinesh V

RUN yum update -y
RUN yum install -y openssh-server sudo 
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN echo 'root:password' | chpasswd
RUN yum install -y wget net-tools java-1.8.0-openjdk initscripts
RUN yum install -y epel-release
RUN yum install -y nginx
COPY app /usr/share/nginx/html/app
COPY nginx.conf /etc/nginx/nginx.conf
RUN ln -s /usr/lib/systemd/system/nginx.service /etc/systemd/system/multi-user.target.wants/nginx.service

Volume /sys/fs/cgroup 
EXPOSE 22
EXPOSE 80
CMD ["/sbin/init"]
