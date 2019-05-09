FROM buildpack-deps:curl

ARG BUILD_DATE
ARG VCS_REF

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y procps && \
  apt-get install -y wget unzip && \
  apt-get install -y iftop && \
  apt-get install -y iptraf &&\
  wget https://www.browserstack.com/browserstack-local/BrowserStackLocal-linux-x64.zip && \
  unzip BrowserStackLocal-linux-x64.zip && \
  chmod +x BrowserStackLocal && \
  rm BrowserStackLocal-linux-x64.zip && \
  mv BrowserStackLocal /usr/local/bin

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="Browserstack Local" \
      org.label-schema.vcs-url="https://github.com/conplementAG/browserstack-local.git" \
      org.label-schema.url="https://github.com/conplementAG/browserstack-local" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0.0"

ENTRYPOINT ["/usr/local/bin/BrowserStackLocal"]