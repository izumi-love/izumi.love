FROM node:12.16.3-alpine

WORKDIR /app

RUN apk update && \
    apk add git && \
    npm install -g npm && \
    npm install -g @vue/cli \
    npm install --save nuxt

ENV HOST 0.0.0.0
EXPOSE 3000
