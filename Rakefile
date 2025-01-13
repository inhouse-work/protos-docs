# frozen_string_literal: true

require "vite_ruby"

ViteRuby.install_tasks

desc "Precompile assets"
task :environment do
  require "./config/boot"

  Staticky.configure do |config|
    config.env = ENV.fetch("RACK_ENV", "development").to_sym
  end

  Staticky.application.monitor(:builder, methods: %i[call]) do |event|
    Staticky.logger.info "Built site in #{event[:time]}ms"
  end
end

namespace :site do
  desc "Build the site assets"
  task :build_assets do
    next unless Staticky.env.production?

    Staticky.logger.info "Precompiling assets..."

    Rake::Task["vite:build"].execute
  end

  desc "Build the site and its assets into the Staticky.build_path (./build)"
  task build: %i[environment build_assets] do
    Staticky.logger.info "Building site in #{Staticky.env.name} environment..."
    Staticky.builder.call
  end

  desc "Watch the site and its assets for changes"
  task watch: :environment do
    require "filewatcher"

    Rake::Task["site:build"].execute unless Staticky.build_path.exist?

    Staticky.logger.info "Watching site in #{Staticky.env.name} environment..."

    Filewatcher.new(
      [
        "app/**/*.rb",
        "lib/**/*.rb",
        "content/**/*"
      ]
    ).watch do
      Staticky.logger.info "Change detected, rebuilding site..."
      sh("bin/rake site:build") do |ok, res|
        unless ok
          Staticky.logger.error "Error rebuilding site:"
          puts res
        end
      end
    end
  end
end
