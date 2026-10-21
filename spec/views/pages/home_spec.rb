# frozen_string_literal: true

RSpec.describe Pages::Home do
  it "renders" do
    render described_class.new

    expect(page).to have_css("html")
  end

  it "renders a single, indexable document head with social metadata" do
    render described_class.new

    expect(page).to have_css("head", count: 1, visible: :all)
    expect(page).to have_css(
      "link[rel='canonical'][href='https://protos.inhouse.work/']",
      visible: :all
    )
    expect(page).to have_css(
      "meta[name='robots'][content='index, follow, max-image-preview:large']",
      visible: :all
    )
    expect(page).to have_css(
      "meta[property='og:image'][content='https://protos.inhouse.work/og-image.jpg']",
      visible: :all
    )
    expect(page).to have_css("script[type='application/ld+json']", visible: :all)
  end
end

RSpec.describe Errors::NotFound do
  it "renders a noindex error page" do
    render described_class.new

    expect(page).to have_css("h1", text: "Page not found.")
    expect(page).to have_css(
      "meta[name='robots'][content='noindex, follow']",
      visible: :all
    )
    expect(page).not_to have_css("link[rel='canonical']", visible: :all)
  end
end
