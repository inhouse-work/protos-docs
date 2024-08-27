# frozen_string_literal: true

module Features
  class Accordions < ApplicationComponent
    def view_template
      render Protos::Accordion.new do |c|
        c.item(class: "border", input_id: "title") do
          c.title { "Accordion Item 1" }
          c.content { "Accordion Item 1 Content" }
        end

        c.item(class: "border") do
          c.title { "Accordion Item 2" }
          c.content { "Accordion Item 2 Content" }
        end
      end
    end
  end
end
