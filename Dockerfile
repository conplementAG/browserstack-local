FROM buildpack-deps:curl

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

ENTRYPOINT ["/usr/local/bin/BrowserStackLocal"]