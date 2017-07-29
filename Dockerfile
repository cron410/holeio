FROM python:2.7-alpine

RUN pip install --no-cache-dir virtualenv && \
  apk update && apk upgrade && \
  apk add --no-cache bash git && \
  git clone https://github.com/anonfunc/holeio.git && \
  cd /holeio && ./install.sh
EXPOSE 8080
#https://stackoverflow.com/questions/20632258/docker-change-directory-command
WORKDIR "/holeio"
RUN /bin/sh -c "/holeio/install.sh"
ENTRYPOINT ["executable","param1","param2"]
CMD ["venv/bin/bottle.py","-b","0.0.0.0:8080","holeio.app"]
