# frozen_string_literal: true

module Features
  class Badges < ApplicationComponent
    TYPES = %i[
      default
      primary
      secondary
      accent
      info
      success
      warning
      error
      ghost
    ].freeze

    SIZES = %i[default xs sm md lg xl].freeze

    def view_template
      div(class: "flex flex-col gap-sm") do
        ul(class: "flex flex-wrap gap-sm") do
          TYPES.each do |type|
            li { badge(type:) { label(type) } }
          end
        end

        ul(class: "flex flex-wrap gap-sm") do
          li { badge(type: :primary, outline: true) { "Outline" } }
          li { badge(type: :primary, dashed: true) { "Dashed" } }
          li { badge(type: :primary, soft: true) { "Soft" } }
        end

        ul(class: "flex flex-wrap items-center gap-sm") do
          SIZES.each do |size|
            li { badge(type: :accent, size:) { size.to_s.upcase } }
          end
        end
      end
    end

    private

    def badge(type: :default, **, &)
      render Protos::Badge.new(type:, **, &)
    end

    def label(type)
      type == :default ? "Badge" : "#{type.to_s.capitalize} Badge"
    end
  end
end
