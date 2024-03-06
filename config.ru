# frozen_string_literal: true

require "./config/boot"
require "logger"

class Server < Roda
  plugin :public, root: "build"
  plugin :common_logger, Logger.new($stdout), method: :info

  plugin :error_handler do |_e|
    File.read("build/500.html")
  end
  plugin :not_found do
    File.read("build/404.html")
  end

  route do |r|
    r.public
    r.root { r.redirect "/index.html" }
  end
end

use(ViteRuby::DevServerProxy, ssl_verify_none: true) if ViteRuby.run_proxy?
run Server.freeze.app
