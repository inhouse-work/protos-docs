# frozen_string_literal: true

module Features
  class Comboboxes < Component
    def template
      render Protos::Combobox.new do |combobox|
        render(combobox.trigger(class: "btn btn-primary")) do
          "Select an option"
        end
        render combobox.content do
          render combobox.list(class: "border rounded-box bg-base-300") do
            render combobox.input(placeholder: "Search...")
            render(combobox.empty) { "No results found" }
            render combobox.group do
              render(combobox.title) { "Quick links" }
              render combobox.item do
                a(href: "#") { "Calendar" }
              end
              render combobox.item do
                a(href: "#") { "Projects" }
              end
            end
          end
        end
      end
    end
  end
end
