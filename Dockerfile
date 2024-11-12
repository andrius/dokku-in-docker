FROM ubuntu:trusty-20190425

RUN apt-get update
RUN apt-get install -y git make curl software-properties-common sudo wget man openssh-server && apt-get clean
RUN apt-get install -y iptables ca-certificates lxc && apt-get clean
RUN apt-get install -y help2man && apt-get clean

RUN locale-gen en_US.*

RUN git clone https://github.com/progrium/dokku /root/dokku && \
	cd /root/dokku/ && \
	git checkout v0.7.2

RUN cd /root/dokku; make sshcommand plugn sigil version copyfiles
RUN dokku plugin:install-dependencies --core
RUN dokku plugin:install --core

RUN curl -sSL https://get.docker.com/ | sh

VOLUME ["/home/dokku","/var/lib/docker","/var/lib/dokku/data","/var/lib/dokku/services"]

ENV HOME /root
WORKDIR /root
ADD ./setup.sh /root/setup.sh
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker
RUN touch /root/.firstrun

EXPOSE 22
EXPOSE 80
EXPOSE 443

CMD ["bash", "/root/setup.sh"]
