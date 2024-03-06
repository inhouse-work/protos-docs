# frozen_string_literal: true

RSpec.describe Builder do
  it "compiles the homepage" do
    files = Dry::Files.new(memory: true)
    builder = described_class.new(files)
    builder.call

    expect(files.exist?("build/index.html")).to be(true)
    expect(files.exist?("build/404.html")).to be(true)
    expect(files.exist?("build/500.html")).to be(true)
  end
end
