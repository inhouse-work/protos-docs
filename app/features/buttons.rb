# frozen_string_literal: true

module Features
  class Buttons < Component
    def view_template
      ul(class: "flex flex-wrap gap-sm") do
        li { button(class: "btn") { "Button" } }
        li { button(class: "btn btn-primary") { "Primary Button" } }
        li { button(class: "btn btn-secondary") { "Secondary Button" } }
        li { button(class: "btn btn-info") { "Info Button" } }
        li { button(class: "btn btn-success") { "Success Button" } }
        li { button(class: "btn btn-warning") { "Warning Button" } }
        li { button(class: "btn btn-error") { "Error Button" } }
      end
    end
  end
end
