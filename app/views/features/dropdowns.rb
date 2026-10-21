# frozen_string_literal: true

module Features
  class Dropdowns < ApplicationComponent
    def view_template
      div(class: "flex flex-wrap gap-sm") do
        render Protos::Dropdown.new(position: :bottom, trigger: :click) do |c|
          c.trigger(class: "btn btn-primary") { "Click dropdown" }
          c.menu(class: "w-52 bg-base-300 rounded-box") do
            c.item { a { "Item 1" } }
            c.item { a { "Item 2" } }
          end
        end

        render Protos::Dropdown.new(position: :right, trigger: :mouseenter) do |c|
          c.trigger(class: "btn btn-secondary", as: :a, href: "#") do
            "Hover dropdown link"
          end
          c.menu(class: "w-52 bg-base-300 rounded-box", as_template: false) do
            c.item { a { "Item 1" } }
            c.item { a { "Item 2" } }
          end
        end
      end
    end
  end
end
