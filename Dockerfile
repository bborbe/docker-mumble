FROM ubuntu:18.04
MAINTAINER Benjamin Borbe <bborbe@rocketnews.de>
ARG VERSION

ENV HOME /root
ENV LANG en_US.UTF-8

RUN set -x \
	&& DEBIAN_FRONTEND=noninteractive apt-get update --quiet \
	&& DEBIAN_FRONTEND=noninteractive apt-get upgrade --quiet --yes \
	&& DEBIAN_FRONTEND=noninteractive apt-get install --quiet --yes --no-install-recommends \
	locales \
	apt-transport-https \
	ca-certificates \
	mumble-server \
	libssl1.0.0 \
	&& DEBIAN_FRONTEND=noninteractive apt-get autoremove --yes \
	&& DEBIAN_FRONTEND=noninteractive apt-get clean
RUN locale-gen en_US.UTF-8

EXPOSE 64738

CMD ["/usr/sbin/murmurd","-fg","-ini","/etc/mumble-server.ini"]
