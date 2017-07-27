FROM python:3.4-alpine

RUN pip install --no-cache-dir virtualenv && \
  apk update && apk upgrade && \
  apk add --no-cache bash git && \
  git clone https://github.com/anonfunc/holeio.git && \
  cd /holeio && ./install.sh

#https://stackoverflow.com/questions/20632258/docker-change-directory-command
WORKDIR "/holeio"
RUN /bin/sh -c "/holeio/install.sh"
EXPOSE 8080
CMD ["/bin/sh -c /holeio/start.sh && tail -f holeio/holeio.log"]
