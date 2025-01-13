# Use an official Ruby runtime based on Alpine as a parent image
FROM ruby:3.4.1-alpine AS builder

ENV RACK_ENV="production" \
    NODE_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_WITHOUT="development:test"

# Update gems and bundler
RUN gem update --system --no-document && \
    gem install -N bundler

# Install necessary packages including Node.js and Yarn
RUN apk add --no-cache build-base git curl npm

ARG NODE_VERSION=23.5.0
ARG PNPM_VERSION=4.4.0

# Install Node.js and Yarn
RUN apk add --no-cache bash curl build-base \
    && curl -sL https://github.com/nodenv/node-build/archive/master.tar.gz | tar xz -C /tmp/ \
    && /tmp/node-build-master/bin/node-build "${NODE_VERSION}" /usr/local/node \
    && npm install -g corepack \
    && corepack enable \
    corepack prepare pnpm@$PNPM_VERSION --activate && \
    && rm -rf /tmp/node-build-master

ENV PATH=/usr/local/node/bin:$PATH

# Set the working directory
WORKDIR /app

# Copy Gemfile and other necessary files
COPY --link Gemfile Gemfile.lock .ruby-version package.json pnpm-lock.yaml  ./

# Install dependencies
RUN bundle install && \
    yarn install --immutable --inline-builds && \
    rm -rf /root/.bundle/cache /usr/local/bundle/cache /var/cache/apk/*

# Copy the rest of the application code
COPY --link . .

# Build the static site (e.g., using Jekyll)
RUN bin/rake site:build

# Use an official Nginx image based on Alpine to serve the static site
FROM nginx:stable-alpine

# Copy the Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the static site files to the Nginx HTML directory
COPY --from=builder /app/build /usr/share/nginx/html/

# Expose port to the Docker host (default is 5000 for dokku)
EXPOSE 5000

# Start Nginx when the container launches
CMD ["nginx", "-c", "/etc/nginx/nginx.conf"]
