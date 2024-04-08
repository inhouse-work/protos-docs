# frozen_string_literal: true

module Features
  class Popovers < Component
    def view_template
      render Protos::Popover.new do |c|
        c.trigger(class: "btn btn-primary") { "Open Popover" }
        c.content(theme: { container: "transition-all" }) do
          ul(class: "menu border rounded-box") do
            li do
              a(href: "#") { "Item 1" }
            end
            li do
              a(href: "#") { "Item 2" }
            end
            li do
              a(href: "#") { "Item 3" }
            end
          end
        end
      end
    end
  end
end
