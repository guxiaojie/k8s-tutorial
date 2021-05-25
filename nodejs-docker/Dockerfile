
FROM node:12-alpine

ARG GIT_COMMIT=unspecified
LABEL git_commit=$GIT_COMMIT

RUN mkdir -p /usr/src/app
COPY package.json /usr/src/app/
WORKDIR /usr/src/app
COPY . /usr/src/app

RUN npm install 

ENTRYPOINT node index.js
