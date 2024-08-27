# frozen_string_literal: true

module Features
  class Collapses < ApplicationComponent
    def view_template
      render Protos::Collapse.new(class: "border", input_id: "collapse") do |c|
        c.title { "Toggle" }
        c.content { "This is the collapse content" }
      end
    end
  end
end
