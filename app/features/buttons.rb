# frozen_string_literal: true

module Features
  class Buttons < Component
    def view_template
      ul(class: "flex flex-wrap gap-sm") do
        li do
          button(class: "btn") { "Button" }
        end

        li do
          button(class: "btn btn-primary") { "Primary Button" }
        end

        li do
          button(class: "btn btn-secondary") { "Secondary Button" }
        end

        li do
          button(class: "btn btn-info") { "Tertiary Button" }
        end

        li do
          button(class: "btn btn-success") { "Success Button" }
        end

        li do
          button(class: "btn btn-warning") { "Warning Button" }
        end

        li do
          button(class: "btn btn-error") { "Error Button" }
        end
      end
    end
  end
end
