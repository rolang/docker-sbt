FROM openjdk:8-alpine

ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

RUN apk update && apk upgrade && apk add --no-cache bash curl openssh tar jq

# install latest sbt
RUN curl -sL $(curl -s 'https://api.github.com/repos/sbt/sbt/releases/latest' | jq -r '.assets[] | select(.content_type == "application/gzip").browser_download_url') | tar -xz -C /usr/local
RUN sbt sbtVersion
