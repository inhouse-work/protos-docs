# frozen_string_literal: true

class Builder
  class << self
    attr_accessor :loader

    def call(...)
      new(...).call
    end
  end

  def initialize(files = Dry::Files.new)
    @files = files
  end

  def call
    compile("build/index.html") { Pages::Home.new.call }
    compile("build/404.html") { Pages::NotFound.new.call }
    compile("build/500.html") { Pages::ServiceError.new.call }
    copy("public/robots.txt", "build/robots.txt")
    copy("public/sitemap.xml", "build/sitemap.xml")
    copy(
      "public/android-chrome-192x192.png",
      "build/android-chrome-192x192.png"
    )
    copy(
      "public/android-chrome-512x512.png",
      "build/android-chrome-512x512.png"
    )
    copy("public/apple-touch-icon.png", "build/apple-touch-icon.png")
    copy("public/favicon-16x16.png", "build/favicon-16x16.png")
    copy("public/favicon-32x32.png", "build/favicon-32x32.png")
    copy("public/favicon.ico", "build/favicon.ico")
    copy("public/site.webmanifest", "build/site.webmanifest")
  end

  def watch
    listener.start
    sleep
  end

  private

  def listener
    call

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

  def copy(source, destination)
    @files.cp(source, destination)
  end
end
