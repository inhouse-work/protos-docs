# frozen_string_literal: true

class Builder
  class << self
    attr_accessor :loader
  end

  def initialize(files = Dry::Files.new)
    @files = files
  end

  def call
    compile("build/index.html") { Pages::Home.new.call }
    compile("build/404.html") { Pages::NotFound.new.call }
    compile("build/500.html") { Pages::ServiceError.new.call }
  end

  def watch
    listener.start
    sleep
  end

  private

  def listener
    Listen.to("app") do
      puts "Rebuilding..."
      self.class.loader.reload
      call
    end
  end

  def compile(filepath)
    content = yield
    @files.write(filepath, content)
  end
end
