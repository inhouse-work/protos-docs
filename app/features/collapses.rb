# frozen_string_literal: true

module Features
  class Collapses < Component
    def view_template
      render Protos::Collapse.new(class: "border") do |c|
        c.title { "Toggle" }
        c.content { "This is the collapse content" }
      end
    end
  end
end
