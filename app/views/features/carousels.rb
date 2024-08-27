# frozen_string_literal: true

module Features
  class Carousels < ApplicationComponent
    def view_template
      render Protos::Carousel.new(
        class: "rounded-box h-96",
        snap_to: :end
      ) do |c|
        images.each do |image|
          c.item { img(src: image, alt: "Random image") }
        end
      end
    end

    private

    def images
      [
        asset_path("images/image-1.webp"),
        asset_path("images/image-2.webp"),
        asset_path("images/image-3.webp")
      ]
    end
  end
end
