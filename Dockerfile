FROM python:3.8

WORKDIR /code

COPY orfalyzer.py .
COPY sequenceanalysis.py .

# To force a chmod in the WDL. What could possibly go wrong?
RUN apt-get update && apt-get -y install sudo

CMD [ "python", "./orfalyzer.py" ]