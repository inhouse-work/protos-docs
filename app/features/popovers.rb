# frozen_string_literal: true

module Features
  class Popovers < Component
    def template
      render Protos::Popover.new do |popover|
        render popover.content(theme: { container: "transition-all" }) do
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

        render popover.trigger(class: "btn btn-primary") { "Open Popover" }
      end
    end
  end
end
