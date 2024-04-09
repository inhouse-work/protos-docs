# frozen_string_literal: true

module Features
  class Dropdowns < Component
    def view_template
      render Protos::Dropdown.new do |c|
        c.trigger(class: "btn btn-primary") { "Open" }
        c.menu(class: "w-52") do
          c.item { a { "Item 1" } }
          c.item { a { "Item 2" } }
        end
      end
    end
  end
end
