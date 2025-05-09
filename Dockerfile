# Use an official Ruby runtime based on Alpine as a parent image
FROM ruby:3.4.2-alpine AS base

# Set the working directory across stages
WORKDIR /app

ENV RACK_ENV="production" \
    NODE_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_WITHOUT="development:test"

# Update gems and bundler

FROM base AS prebuild

# Install necessary packages including Node.js and pnpm
RUN apk add --no-cache \
    bash \
    build-base \
    git \
    curl \
    nodejs \
    npm

FROM prebuild AS node

ARG NODE_VERSION=23.10.0
ARG PNPM_VERSION=10.10.0
ENV PATH=/usr/local/node/bin:$PATH
# Install Node.js and Yarn
RUN  curl -sL https://github.com/nodenv/node-build/archive/master.tar.gz | tar xz -C /tmp/ \
    && /tmp/node-build-master/bin/node-build "${NODE_VERSION}" /usr/local/node \
    && npm install -g pnpm@$PNPM_VERSION \
    && rm -rf /tmp/node-build-master

COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

FROM prebuild AS build

# Copy Gemfile and other necessary files
COPY --link Gemfile Gemfile.lock .ruby-version ./

# Install dependencies
RUN bundle install && \
    rm -rf /root/.bundle/cache /usr/local/bundle/cache /var/cache/apk/*

# Copy node modules
COPY --from=node /app/node_modules /app/node_modules
COPY --from=node /usr/local/node /usr/local/node
ENV PATH=/usr/local/node/bin:$PATH

# Copy the rest of the application code
COPY . .

# Build the static site (e.g., using Jekyll)
RUN npm install -g pnpm@$PNPM_VERSION && bin/vite build && bin/rake site:build

# Use an official Nginx image based on Alpine to serve the static site
FROM nginx:stable-alpine AS release

# Copy the Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the static site files to the Nginx HTML directory
COPY --from=build /app/build /usr/share/nginx/html/

# Expose port to the Docker host (default is 5000 for dokku)
EXPOSE 5000

# Start Nginx when the container launches
CMD ["nginx", "-c", "/etc/nginx/nginx.conf"]
