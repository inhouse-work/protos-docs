# frozen_string_literal: true

module Features
  class Alerts < Component
    def view_template
      render Protos::Alert.new do |c|
        c.icon do
          icon("check-circle")
        end

        plain "Hello world"

        c.actions do
          button(class: "btn btn-primary btn-sm btn-circle") do
            icon("x-circle", variant: :outline)
          end
        end
      end
    end
  end
end
