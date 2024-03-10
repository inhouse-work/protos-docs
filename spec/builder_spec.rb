# frozen_string_literal: true

RSpec.describe Builder do
  it "compiles the homepage" do
    files = Dry::Files.new(memory: true)
    files.touch("public/favicon.ico")
    files.touch("public/robots.txt")
    files.touch("public/sitemap.xml")
    files.touch("public/android-chrome-192x192.png")
    files.touch("public/android-chrome-512x512.png")
    files.touch("public/apple-touch-icon.png")
    files.touch("public/favicon-16x16.png")
    files.touch("public/favicon-32x32.png")
    files.touch("public/site.webmanifest")
    builder = described_class.new(files)
    builder.call

    expect(files.exist?("build/index.html")).to be(true)
    expect(files.exist?("build/404.html")).to be(true)
    expect(files.exist?("build/500.html")).to be(true)
    expect(files.exist?("build/favicon.ico")).to be(true)
  end
end
