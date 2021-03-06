# BEGIN
FROM debian:stable
WORKDIR /root
COPY .bashrc ./
RUN apt-get -qq update && \
    apt-get -qq install \
        vim git mtr-tiny traceroute wget curl \
        netcat-traditional openssh-client mosh \
	dnsutils iperf ca-certificates && \
    apt-get -qq purge lib-*dev build-essential &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
# END
