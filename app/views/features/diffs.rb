# frozen_string_literal: true

module Features
  class Diffs < ApplicationComponent
    def view_template
      render Protos::Diff.new do |c|
        c.item_one do
          img(src: asset_path("daisy-clear.webp"), alt: "Daisy clear")
        end

        c.item_two do
          img(src: asset_path("daisy-blur.webp"), alt: "Daisy blurred")
        end

        c.resizer
      end
    end
  end
end
