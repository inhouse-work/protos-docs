# syntax=docker/dockerfile:1
ARG RUBY_VERSION=4.0.6
ARG NODE_VERSION=26.7.0
ARG PNPM_VERSION=12.14.0
ARG BUNDLER_VERSION=4.1.0.beta1

FROM ruby:${RUBY_VERSION}-alpine AS base

# Re-declare build args from before the first FROM so they are available here.
ARG BUNDLER_VERSION

WORKDIR /app

RUN gem install bundler -v "$BUNDLER_VERSION" && \
    rm -rf /root/.gem /var/cache/apk/*

ENV RACK_ENV="production" \
    NODE_ENV="production" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_FROZEN="true" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_WITHOUT="development:test"

FROM base AS deps

RUN apk add --no-cache build-base git && \
    rm -rf /var/cache/apk/*

FROM node:${NODE_VERSION}-alpine AS node

WORKDIR /app

RUN npm install -g pnpm@${PNPM_VERSION}

COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./

# Point pnpm's store at a known location so the build cache mount below captures it
ENV PNPM_HOME=/pnpm

RUN --mount=type=cache,target=/pnpm/store pnpm install --frozen-lockfile

FROM deps AS build

COPY Gemfile Gemfile.lock .ruby-version ./

RUN bundle install && \
    rm -rf /usr/local/bundle/cache /var/cache/apk/*

COPY --from=node /app/node_modules /app/node_modules

COPY --from=node /usr/local/bin/node /usr/local/bin/
COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules/
RUN ln -sf ../lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm && \
    ln -sf ../lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx && \
    ln -sf ../lib/node_modules/pnpm/pnpm /usr/local/bin/pnpm && \
    ln -sf ../lib/node_modules/pnpm/pnpx /usr/local/bin/pnpx

COPY . .

RUN bin/rake site:build && \
    find build -type f \( -name '*.css' -o -name '*.js' -o -name '*.html' -o -name '*.json' -o -name '*.xml' \) -exec gzip -k {} \;

FROM nginx:stable-alpine AS release

COPY nginx.conf security-headers.conf /etc/nginx/

COPY --from=build /app/build /usr/share/nginx/html/

RUN mkdir -p /tmp/nginx && chown -R nginx:nginx /tmp/nginx

USER nginx

EXPOSE 5000

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget -qO- http://127.0.0.1:5000/ >/dev/null || exit 1

CMD ["nginx", "-c", "/etc/nginx/nginx.conf"]
