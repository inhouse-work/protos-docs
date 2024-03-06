# frozen_string_literal: true

require "./config/boot"

desc "Build the site"
task :build do
  Builder.new.call
end

desc "Continuously build the site"
task :watch do
  Builder.new.watch
end
