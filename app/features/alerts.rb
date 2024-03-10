# frozen_string_literal: true

module Features
  class Alerts < Component
    def template
      render Protos::Alert.new do |alert|
        render alert.icon do
          icon("check-circle")
        end

        plain "Hello world"

        render alert.actions do
          button(class: "btn btn-primary btn-sm") do
            icon("x-circle")
          end
        end
      end
    end
  end
end
