# frozen_string_literal: true

module Features
  class Statuses < ApplicationComponent
    TYPES = %i[
      default
      primary
      secondary
      accent
      info
      success
      warning
      error
    ].freeze

    SIZES = %i[default xs sm md lg xl].freeze

    def view_template
      div(class: "flex flex-col gap-sm") do
        ul(class: "flex flex-wrap items-center gap-sm") do
          TYPES.each do |type|
            li { status(type:) }
          end
        end

        ul(class: "flex flex-wrap items-center gap-sm") do
          SIZES.each do |size|
            li { status(type: :primary, size:) }
          end
        end
      end
    end

    private

    def status(type: :default, **, &)
      render Protos::Status.new(type:, **, &)
    end
  end
end
