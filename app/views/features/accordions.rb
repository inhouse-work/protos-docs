# frozen_string_literal: true

module Features
  class Accordions < ApplicationComponent
    def view_template
      div(class: "flex flex-col gap-sm w-full") do
        render Protos::Accordion.new(
          class: "border rounded-box",
          input_name: "docs-accordion"
        ) do |c|
          c.item do
            c.title { "Accordion Item 1" }
            c.content { "Accordion Item 1 Content" }
          end

          c.item do
            c.title { "Accordion Item 2" }
            c.content { "Accordion Item 2 Content" }
          end
        end

        render Protos::Accordion.new(
          class: "border rounded-box",
          input_name: "docs-accordion-checkboxes",
          input_type: :checkbox
        ) do |c|
          c.item do
            c.title { "Independent Item 1" }
            c.content { "Multiple items can be open at once" }
          end

          c.item do
            c.title { "Independent Item 2" }
            c.content { "This item can also be opened" }
          end
        end
      end
    end
  end
end
