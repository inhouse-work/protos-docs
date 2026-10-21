# frozen_string_literal: true

module Features
  class Collapses < ApplicationComponent
    def view_template
      div(class: "flex flex-col gap-sm w-full") do
        render Protos::Collapse.new(
          class: "border",
          input_name: "docs-collapse",
          icon: :plus
        ) do |c|
          c.title { "Toggle" }
          c.content { "This is the collapse content" }
        end

        render Protos::Collapse.new(
          class: "border",
          input_name: "docs-open-collapse",
          input_type: :radio,
          state: :open,
          icon: :arrow
        ) do |c|
          c.title { "Open by default" }
          c.content { "This collapse starts expanded" }
        end
      end
    end
  end
end
