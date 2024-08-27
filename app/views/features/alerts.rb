# frozen_string_literal: true

module Features
  class Alerts < ApplicationComponent
    def view_template
      render Protos::Alert.new do |c|
        c.icon { icon("check-circle") }
        plain "Hello world"

        c.actions do
          button(
            class: "btn btn-primary btn-sm btn-circle",
            aria_label: "Something"
          ) do
            icon("x-circle", variant: :outline)
          end
        end
      end
    end
  end
end
