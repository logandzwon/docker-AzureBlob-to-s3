FROM debian:stretch-slim
LABEL maintainer "Logan Dzwonkowski logan.dzwonkowski@envisionhealth.com"

# Install required packages
RUN apt-get update \
    && apt-get -q -y dist-upgrade \
    && apt-get install -y --no-install-recommends \
         python3-pip \
	 curl

# Install nodejs repo and nodejs
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN npm install --save azure-blob-to-s3

# Entrypoint
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
