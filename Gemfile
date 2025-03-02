# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby file: ".ruby-version"

gem "protos"
gem "protos-icon"
gem "protos-markdown"

gem "dry-inflector"
gem "front_matter_parser"
gem "rack"
gem "rake"
gem "rouge"
gem "staticky", github: "nolantait/staticky", branch: "master"
gem "vite_ruby"
gem "zeitwerk"

group :test do
  gem "capybara", require: false
  gem "debug"
  gem "rspec"
end

group :development do
  gem "filewatcher", require: false
  gem "puma"
  gem "rubocop"
  gem "rubocop-inhouse", require: false
end
