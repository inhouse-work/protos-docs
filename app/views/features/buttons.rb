# frozen_string_literal: true

module Features
  class Buttons < ApplicationComponent
    COLORS = %i[default primary secondary accent info success warning error].freeze
    VARIANTS = %i[default outline ghost link soft dash].freeze
    SIZES = %i[default xs sm md lg xl].freeze

    def view_template
      div(class: "flex flex-col gap-sm") do
        ul(class: "flex flex-wrap gap-sm") do
          COLORS.each do |color|
            li { button(color:) { color.to_s.capitalize } }
          end
        end

        ul(class: "flex flex-wrap gap-sm") do
          VARIANTS.each do |variant|
            li { button(color: :primary, variant:) { variant.to_s.capitalize } }
          end
        end

        ul(class: "flex flex-wrap items-center gap-sm") do
          SIZES.each do |size|
            li { button(color: :secondary, size:) { size.to_s.upcase } }
          end
          li { button(color: :success, active: true) { "Active" } }
          li { button(disabled: true) { "Disabled" } }
        end

        ul(class: "flex flex-wrap items-center gap-sm") do
          li { button(color: :primary, shape: :square) { icon("plus") } }
          li { button(color: :error, shape: :circle) { icon("x-circle") } }
          li do
            button(element: :a, href: "#", color: :info, variant: :outline) do
              "Link Button"
            end
          end
        end

        button(color: :primary, block: true) { "Block Button" }
        button(color: :secondary, wide: true) { "Wide Button" }
      end
    end

    private

    def button(**, &)
      render Protos::Button.new(**, &)
    end
  end
end
