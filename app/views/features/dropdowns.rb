# frozen_string_literal: true

module Features
  class Dropdowns < ApplicationComponent
    def view_template
      render Protos::Dropdown.new do |c|
        c.trigger(id: "trigger", class: "btn btn-primary") { "Open" }
        c.menu(class: "w-52 bg-base-300 rounded-box") do
          c.item { a { "Item 1" } }
          c.item { a { "Item 2" } }
        end
      end
    end
  end
end
