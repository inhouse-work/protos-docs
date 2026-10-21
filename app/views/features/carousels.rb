# frozen_string_literal: true

module Features
  class Carousels < ApplicationComponent
    def view_template
      div(class: "flex flex-col gap-md w-full") do
        render Protos::Carousel.new(
          class: "rounded-box h-96",
          snap_to: :center
        ) do |c|
          images.each do |image|
            c.item { img(src: image, alt: "Random image") }
          end

          c.actions do
            button(class: "btn btn-circle btn-sm", aria_label: "Previous") do
              icon("chevron-left")
            end
            button(class: "btn btn-circle btn-sm", aria_label: "Next") do
              icon("chevron-right")
            end
          end
        end

        render Protos::Carousel.new(
          vertical: true,
          class: "rounded-box h-92 w-auto mx-auto"
        ) do |c|
          3.times do |index|
            c.item(class: "h-full w-full") do
              div(
                class: %w[
                  w-full
                  grid
                  place-items-center
                  bg-base-200
                  p-lg
                  whitespace-nowrap
                ]
              ) do
                "Slide #{index + 1}"
              end
            end
          end
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
