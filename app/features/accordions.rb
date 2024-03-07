# frozen_string_literal: true

module Features
  class Accordions < Component
    def template
      render Protos::Accordion.new do |accordion|
        render accordion.item(class: "border") do
          render(accordion.title) { "Accordion Item 1" }
          render(accordion.content) { "Accordion Item 1 Content" }
        end

        render accordion.item(class: "border") do
          render(accordion.title) { "Accordion Item 2" }
          render(accordion.content) { "Accordion Item 2 Content" }
        end
      end
    end
  end
end
