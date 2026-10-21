# frozen_string_literal: true

module Features
  class Alerts < ApplicationComponent
    COLORS = %i[default info success warning error].freeze
    VARIANTS = %i[default outline dash soft].freeze

    def view_template
      div(class: "flex flex-col gap-sm w-full") do
        COLORS.each do |color|
          render Protos::Alert.new(color:) do |c|
            c.icon { icon("check-circle") }
            plain "#{color.to_s.capitalize} alert"

            if color == :success
              c.actions do
                button(
                  class: "btn btn-sm btn-circle btn-ghost",
                  aria_label: "Dismiss"
                ) do
                  icon("x-circle", variant: :outline)
                end
              end
            end
          end
        end

        ul(class: "flex flex-wrap gap-sm") do
          VARIANTS.each do |variant|
            li do
              render Protos::Alert.new(color: :info, variant:) do
                plain "#{variant.to_s.capitalize} alert"
              end
            end
          end
        end

        render Protos::Alert.new(color: :info, direction: :vertical) do |c|
          c.icon { icon("check-circle") }
          plain "Vertical alert"
          c.actions do
            button(class: "btn btn-sm") { "Action" }
          end
        end
      end
    end
  end
end
