FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y texlive-full biber pandoc fonts-font-awesome curl make git \
    && apt-get clean
