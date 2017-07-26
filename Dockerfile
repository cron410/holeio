FROM python:3.4-alpine

RUN pip install --no-cache-dir virtualenv && \
  apk update && apk upgrade && \
  apk add --no-cache bash git && \
  git clone https://github.com/anonfunc/holeio.git && \
  cd /holeio && ./install.sh
  
  
CMD ["holeio/start.sh"]
