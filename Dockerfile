FROM ubuntu:18.04

COPY orfalyzer.py .
COPY sequenceanalysis.py .
COPY mini_e_coli.fna mini_e_coli.fna
COPY out.txt out.txt

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python
  #&& pip3 install --upgrade pip

# debug output, to prove these are indeed in the container
RUN ls -l
RUN head orfalyzer.py
RUN head sequenceanalysis.py
RUN head mini_e_coli.fna 

# needed for the utf-8 output 
ENV LANG C.UTF-8

CMD [ "python3", "orfalyzer.py"]