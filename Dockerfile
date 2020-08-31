FROM python:3.8

ARG BUILD_DATE
ARG VERSION
LABEL build_date="${BUILD_DATE}"
LABEL version="${VERSION}"

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV PATH="/CPULoadGenerator:${PATH}"

ENV APTLIST="git python-matplotlib python-psutil python-twisted"

RUN apt-get update -q && \
  apt-get install $APTLIST -qy && \
  apt-get clean && \
  rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* /root/.cache

RUN cd / && \
  git clone https://github.com/GaetanoCarlucci/CPULoadGenerator.git  /CPULoadGenerator && \
  rm /CPULoadGenerator/50%-Target-Load.jpg

WORKDIR /CPULoadGenerator

CMD ["./CPULoadGenerator.py", "--help"]
