# frozen_string_literal: true

module Features
  class Commands < Component
    def view_template
      render Protos::Command.new do |c|
        c.trigger(class: "btn btn-primary") do
          span { "Open" }
        end

        c.dialog do
          c.list do
            c.input(placeholder: "Search...")
            c.empty { "No results found" }

            c.group do
              c.title { "Suggestions" }
              c.item { a(href: "#") { "Calendar" } }
              c.item { a(href: "#") { "Search Emoji" } }
            end

            c.group do
              c.title { "Settings" }
              c.item { a(href: "#") { "Profile" } }
              c.item { a(href: "#") { "Mail" } }
              c.item { a(href: "#") { "Settings" } }
            end
          end
        end
      end
    end
  end
end
