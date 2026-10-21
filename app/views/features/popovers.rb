# frozen_string_literal: true

module Features
  class Popovers < ApplicationComponent
    def view_template
      div(class: "flex flex-wrap gap-sm") do
        render Protos::Popover.new(
          position: :bottom,
          animation: :scale,
          trigger: :click
        ) do |c|
          c.trigger(id: "docs-popover-trigger", class: "btn btn-primary") do
            "Click popover"
          end
          c.content(theme: { container: "transition-all" }) do
            ul(class: "menu border rounded-box") do
              li { a(href: "#") { "Item 1" } }
              li { a(href: "#") { "Item 2" } }
              li { a(href: "#") { "Item 3" } }
            end
          end
        end

        render Protos::Popover.new(position: :right, trigger: :mouseenter) do |c|
          c.trigger(
            class: "btn btn-secondary",
            as: :a,
            href: "#",
            id: "docs-hover-popover-trigger"
          ) do
            "Hover popover link"
          end
          c.content(as_template: false) do
            "This popover is positioned to the right."
          end
        end
      end
    end
  end
end
