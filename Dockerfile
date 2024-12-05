FROM alpine:3.21

ENV GITLEAKS_VERSION=8.2.7

RUN apk update \
    && apk upgrade \
    && apk --no-cache add curl perl-utils git \
    && mkdir /src

WORKDIR /src

COPY --chmod=0755 ./entrypoint.sh /usr/local/bin/entrypoint.sh

RUN curl -LO https://github.com/zricethezav/gitleaks/releases/download/v${GITLEAKS_VERSION}/gitleaks_${GITLEAKS_VERSION}_linux_x64.tar.gz \
    && curl -LO https://github.com/zricethezav/gitleaks/releases/download/v${GITLEAKS_VERSION}/gitleaks_${GITLEAKS_VERSION}_checksums.txt \
    && grep gitleaks_${GITLEAKS_VERSION}_linux_x64.tar.gz gitleaks_${GITLEAKS_VERSION}_checksums.txt > gitleaks_checksum.txt \
    && shasum -a 256 -c gitleaks_checksum.txt \
    && tar zxvf gitleaks_${GITLEAKS_VERSION}_linux_x64.tar.gz \
    && chmod +x gitleaks \
    && mv gitleaks /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
