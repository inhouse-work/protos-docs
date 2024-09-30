# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby_version = Pathname.new(__dir__).join(".ruby-version")
ruby ruby_version.read.strip

gem "protos", github: "inhouse-work/protos", branch: "master"
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
  gem "phlex-testing-capybara"
  gem "rspec"
end

group :development do
  gem "filewatcher", require: false
  gem "puma"
  gem "rubocop"
  gem "rubocop-inhouse", require: false
end
