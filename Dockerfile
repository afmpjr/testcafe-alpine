# Stage 1: Building and installing TestCafe dependencies
FROM node:20-alpine AS builder

# Install basic dependencies
# RUN apk --no-cache add wget ca-certificates gnupg bzip2

# Firefox
RUN apk add firefox

# Chrome
RUN apk add chromium

# Clean up
RUN rm -rf /var/cache/apk/*

# TestCafe
RUN npm install -g testcafe && \
    npm cache clean --force

WORKDIR /testcafe

# Default command
CMD ["testcafe"]
