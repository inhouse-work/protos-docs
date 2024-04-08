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
              c.item do
                a(href: "#") { "Calendar" }
              end
              c.item do
                a(href: "#") { "Search Emoji" }
              end
            end

            c.group do
              c.title { "Settings" }
              c.item do
                a(href: "#") { "Profile" }
              end
              c.item do
                a(href: "#") { "Mail" }
              end
              c.item do
                a(href: "#") { "Settings" }
              end
            end
          end
        end
      end
    end
  end
end
