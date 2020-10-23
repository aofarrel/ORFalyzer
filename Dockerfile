FROM python:3.7.9-alpine3.12

COPY orfalyzer/orfalyzer.py .
COPY orfalyzer/sequenceanalysis.py .
COPY mini_e_coli.fna .

# needed for the utf-8 output 
ENV LANG C.UTF-8

ENTRYPOINT [] # bizarre workaround for running alpine on WDL

CMD [ "python3", "orfalyzer.py"]