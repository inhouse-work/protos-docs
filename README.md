# Protos Documentation

This repo contains examples of [protos](https://github.com/inhouse-work/protos)
components and is live at:

https://protos.inhouse.work

This site was created with [staticky](https://github.com/nolantait/staticky),
a static site builder with first class support for [Phlex](https://phlex.fun)
components.

## Development

```
bin/setup
bin/dev
```

This runs the site builder, the Vite dev server and Puma with the Vite proxy.

## Building

`bin/rake site:build` generates the sitemap, compiles the Vite assets in
production and writes the whole site into `build/`.

## Deployment

The site is deployed to Dokku. The multi-stage `Dockerfile` installs the Ruby
and Node dependencies, builds the static site and serves it with nginx. The
`nginx.conf` handles canonical redirects, gzip/brotli-friendly caching, error
pages and security headers (see `security-headers.conf`). `app.json` configures
Dokku's zero-downtime health check.

Deploy by pushing `master` to the Dokku remote:

```
git push dokku master
```
