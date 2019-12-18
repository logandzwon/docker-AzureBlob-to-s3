FROM debian:stretch-slim
LABEL maintainer "Logan Dzwonkowski logan.dzwonkowski@envisionhealth.com"

# Install required packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
         ca-certificates \
         curl \
         build-essential \
         git \
         libfuse-dev \
         libcurl4-openssl-dev \
         libxml2-dev \
         mime-support \
         automake \
         libtool \
         pkg-config \
         libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Install AZcopy
RUN set -ex \
    && curl -L -o azcopy.tar.gz https://azcopyvnext.azureedge.net/release20190703/azcopy_linux_amd64_10.2.1.tar.gz \
    && tar -xzf azcopy.tar.gz && rm -f azcopy.tar.gz \
    && cp ./azcopy_linux_amd64_10.2.1/azcopy /usr/local/bin/. \
    && chmod +x /usr/local/bin/azcopy \
    && rm -rf azcopy_linux_amd64_10.2.1

# Install S3FS to mount S3 bucket
RUN git clone https://github.com/s3fs-fuse/s3fs-fuse \
    && cd s3fs-fuse \
    && ./autogen.sh && ./configure --prefix=/usr --with-openssl && make && make install \
    && cd .. \
    && rm -rf s3fs-fuse \
    && mkdir /tmp/cache \
    && chmod 777 /tmp/cache \
    && mkdir /mnt/s3bucket

# Entrypoint
COPY entrypoint.sh /
ENTRYPOINT ["/bin/bash", "-c", "/entrypoint.sh"]

