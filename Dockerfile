FROM node:10

COPY bin/entrypoint.sh /
RUN chmod +x /entrypoint.sh

RUN mkdir /web && mkdir /api

COPY /web/ /web
COPY /api/ /api

WORKDIR /web

RUN npm install -g gulp && \
      npm install -g json-server && \
      npm install && \
      gulp build

EXPOSE 1234/tcp
EXPOSE 3030/tcp

CMD /entrypoint.sh
