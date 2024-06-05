FROM node:20-alpine AS builder

# install Firefox
RUN apk add firefox

# install Chrome
RUN apk add chromium

# do clean up
RUN rm -rf /var/cache/apk/*

# install TestCafe and do clean up
RUN npm install -g testcafe && \
    npm cache clean --force

WORKDIR /testcafe

# default command
CMD ["testcafe"]
