# frozen_string_literal: true

module Features
  class Drawers < Component
    def view_template
      render Protos::Drawer.new(id: "some_id") do |c|
        c.content do
          c.trigger(class: "btn btn-primary") { "Open Drawer" }
        end

        c.side(class: "z-[999]") do
          ul(class: "menu p-4 w-80 min-h-full bg-base-200 text-base-content") do
            li do
              a { "Main Menu" }
            end
          end
        end
      end
    end
  end
end
