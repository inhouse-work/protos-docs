# frozen_string_literal: true

RSpec.describe Sitemap do
  it "includes indexable routes and excludes error pages" do
    resource = Struct.new(:url)
    router = Struct.new(:resources).new(
      [resource.new("/"), resource.new("404"), resource.new("500")]
    )

    xml = described_class.call(
      router:,
      last_modified: Time.utc(2026, 1, 1, 12)
    )

    expect(xml).to include("<loc>https://protos.inhouse.work/</loc>")
    expect(xml).to include("<lastmod>2026-01-01T12:00:00Z</lastmod>")
    expect(xml).not_to include("404")
    expect(xml).not_to include("500")
  end
end
