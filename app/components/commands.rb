module Components
  class Commands < Component
    def template
      render Protos::Command.new do |command|
        render command.trigger(class: "btn btn-primary") do
          span { "Open" }
        end

        render command.dialog do
          render command.list do
            render command.input(placeholder: "Search...")

            render(command.empty) { "No results found" }

            render command.group do
              render(command.title) { "Suggestions" }
              render command.item do
                a(href: "#") { "Calendar" }
              end
              render(command.item) do
                a(href: "#") { "Search Emoji" }
              end
            end

            render command.group do
              render(command.title) { "Settings" }
              render command.item do
                a(href: "#") { "Profile" }
              end
              render command.item do
                a(href: "#") { "Mail" }
              end
              render command.item do
                a(href: "#") { "Settings" }
              end
            end
          end
        end
      end
    end
  end
end
