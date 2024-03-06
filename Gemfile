# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(".ruby-version").strip

gem "protos", github: "inhouse-work/protos", branch: "master"
gem "protos-icon"

gem "dry-files"
gem "phlex"
gem "rack"
gem "rackup"
gem "rake"
gem "vite_ruby"
gem "zeitwerk"

group :test do
  gem "debug"
  gem "rspec"
end

group :development do
  gem "listen"
  gem "roda"
  gem "rubocop-inhouse", require: false
end
