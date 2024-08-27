# frozen_string_literal: true

module Features
  class Comboboxes < ApplicationComponent
    def view_template
      render Protos::Combobox.new do |c|
        c.trigger(id: "trigger", class: "btn btn-primary") do
          "Select an option"
        end
        c.content do
          c.list(class: "border rounded-box bg-base-300") do
            c.input(placeholder: "Search...")
            c.empty { "No results found" }
            c.group do
              c.title { "Quick links" }
              c.item { a(href: "#") { "Calendar" } }
              c.item { a(href: "#") { "Projects" } }
            end
          end
        end
      end
    end
  end
end
