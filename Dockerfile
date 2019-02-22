FROM openjdk:11-slim

ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

RUN apt-get update && apt-get upgrade -y && apt-get install curl tar jq git -y

# install latest sbt
RUN curl -sL $(curl -s 'https://api.github.com/repos/sbt/sbt/releases/latest' | jq -r '.assets[] | select(.content_type == "application/gzip").browser_download_url') | tar -xz -C /usr/local
RUN sbt sbtVersion
