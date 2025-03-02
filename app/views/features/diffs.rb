# frozen_string_literal: true

module Features
  class Diffs < ApplicationComponent
    def view_template
      render Protos::Diff.new(class: "aspect-16/9 h-96") do |c|
        c.item_one do
          img(
            src: asset_path("images/daisy-clear.webp"),
            alt: "Daisy clear"
          )
        end

        c.item_two(tabindex: 0) do
          img(
            src: asset_path("images/daisy-blur.webp"),
            alt: "Daisy blurred"
          )
        end

        c.resizer
      end
    end
  end
end
