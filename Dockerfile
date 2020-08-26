FROM ubuntu:18.04

COPY orfalyzer.py orfalyzer.py
COPY sequenceanalysis.py sequenceanalysis.py
COPY mini_e_coli.fna mini_e_coli.fna
COPY out.txt out.txt

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

RUN ls -l

ENV LANG C.UTF-8

CMD [ "python3", "orfalyzer.py", "mini_e_coli.fna", "out.txt" ]