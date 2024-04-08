# frozen_string_literal: true

RSpec.describe Pages::Home do
  it "renders" do
    page = described_class.new.call

    expect(page).to start_with("<html")
  end
end
