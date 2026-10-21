# frozen_string_literal: true

require "logger"
require "./config/boot"
require "staticky/server"

# ViteRuby::DevServerProxy derives the upstream from the Host header, but
# rack-proxy 1.0+ refuses Host-derived backends by default (SSRF hardening)
# and returns 502 unless allow_dynamic_backend is set. Safe here because the
# proxy overwrites HTTP_HOST with config.host before forwarding. Remove this
# option if vite_ruby adds a :backend option in a future release.
# See https://github.com/ElMassimo/vite_ruby/issues/619
use(ViteRuby::DevServerProxy, ssl_verify_none: true, allow_dynamic_backend: true) if ViteRuby.run_proxy?
run Staticky::Server.app.freeze
