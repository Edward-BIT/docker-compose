FROM zhangbowen1223/ubuntu20-dev:0.5

MAINTAINER Bowen zbwhyx@126.com

# 更新apt缓存、安装ssh服务
RUN apt-get update
RUN apt-get install -y openssh-server
RUN apt-get install -y cmake
RUN apt-get install -y make
RUN apt-get install -y gcc
RUN apt-get install -y git
RUN apt-get install -y build-essential
RUN apt-get install -y htop
RUN apt-get install -y tmux
RUN apt-get install -y vim
RUN apt-get install -y curl
RUN apt-get install -y zsh

RUN apt-get upgrade -y

RUN mkdir -p /var/run/sshd 
RUN mkdir -p /root/.sshd

# 配置免密和自启动脚本
ADD run.sh /run.sh
# ADD authorized_keys /root/.ssh/authorized_keys
RUN chmod 755 /run.sh

# 开放22端口
EXPOSE 22
EXPOSE 5901

# 设置脚本自启动
CMD ["/run.sh"]