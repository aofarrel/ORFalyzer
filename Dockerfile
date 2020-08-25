FROM python:3

MAINTAINER Ash OFarrell <aofarrel@ucsc.edu>

USER root
ADD ./orfalyzer.py .
ADD ./sequenceanalysis.py .

CMD python3 ./orfalyzer.py