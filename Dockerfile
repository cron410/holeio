FROM python:2.7-alpine

WORKDIR "/holeio"
RUN pip install --no-cache-dir virtualenv && \
  apk update && apk upgrade && \
  apk add --no-cache bash git && \
##  git clone https://github.com/anonfunc/holeio.git
COPY . /holeio
RUN /bin/sh -c "/holeio/install.sh"
EXPOSE 8080:8080
CMD ["venv/bin/bottle.py","-b","0.0.0.0:8080","holeio.app"]
