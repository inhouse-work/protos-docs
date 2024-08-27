# frozen_string_literal: true

module Features
  class Drawers < ApplicationComponent
    def view_template
      render Protos::Drawer.new(id: "some_id") do |c|
        c.content do
          c.trigger(id: "trigger", class: "btn btn-primary") { "Open Drawer" }
        end

        c.side(class: "z-[999]") do
          ul(class: css[:menu]) do
            li { a { "Main Menu" } }
          end
        end
      end
    end

    private

    def theme
      {
        menu: tokens(
          "menu",
          "p-4",
          "w-80",
          "min-h-full",
          "bg-base-200",
          "text-base-content"
        )
      }
    end
  end
end
