FROM ubuntu:14.04
MAINTAINER Benjamin Borbe <bborbe@rocketnews.de>
ENV HOME /root
ENV LANG en_US.UTF-8
RUN locale-gen en_US.UTF-8

RUN set -x \
	&& apt-get update --quiet \
	&& apt-get upgrade --quiet --yes \
	&& apt-get install --quiet --yes --no-install-recommends mumble-server \
	&& apt-get autoremove --yes \
	&& apt-get clean

EXPOSE 64738

CMD ["/usr/sbin/murmurd","-fg","-ini","/etc/mumble-server.ini"]