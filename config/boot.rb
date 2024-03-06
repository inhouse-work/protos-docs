# frozen_string_literal: true

ENV["RACK_ENV"] ||= "development"

require "bundler"
Bundler.require(:default, :development)

loader = Zeitwerk::Loader.new
loader.push_dir("lib")
loader.push_dir("app")
loader.enable_reloading
loader.setup

Builder.loader = loader
