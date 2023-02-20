FROM kalilinux/kali-rolling
# Metadata params
ARG BUILD_DATE
ARG VERSION
ARG VCS_URL
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.vcs-url=$VCS_URL \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.version=$VERSION \
    org.label-schema.name='Kali Linux' \
    org.label-schema.description='Official Kali Linux docker image' \
    org.label-schema.usage='https://www.kali.org/news/official-kali-linux-docker-images/' \
    org.label-schema.url='https://www.kali.org/' \
    org.label-schema.vendor='Offensive Security' \
    org.label-schema.schema-version='1.0' \
    org.label-schema.docker.cmd='docker run --rm kalilinux/kali-rolling' \
    org.label-schema.docker.cmd.devel='docker run --rm -it kalilinux/kali-rolling' \
    org.label-schema.docker.debug='docker logs $CONTAINER' \
    io.github.offensive-security.docker.dockerfile="Dockerfile" \
    io.github.offensive-security.license="GPLv3" \
    MAINTAINER="Ziyao Wang <ziyao.wang@se19.qmul.ac.uk>"
ENV DEBIAN_FRONTEND noninteractive
RUN set -x \
    && apt -yqq update \
    && apt -y install --no-install-recommends git metasploit-framework nmap hydra sqlmap telnet openssh-client dnsutils yersinia ettercap-text-only cisco-global-exploiter cisco-auditing-tool sslscan snmp nano dsniff dnschef fping hping3 tshark python3-scapy net-tools iputils-ping iproute2 ipv6-toolkit thc-ipv6 tcpdump curl \
    && rm -rf /var/lib/apt/lists/* \
    && apt clean \
    && cd /root && git clone https://github.com/thiagoralves/defcon26.git
CMD ["bash"]
