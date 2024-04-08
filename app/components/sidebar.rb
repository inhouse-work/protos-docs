# frozen_string_literal: true

module Components
  class Sidebar < Component
    param :features

    def view_template
      aside(**attrs) do
        nav do
          ul(class: css[:list]) do
            features.each do |name|
              li do
                a(href: "##{name.downcase}") { name }
              end
            end
          end
        end
      end
    end

    private

    def theme
      {
        container: tokens(
          "relative",
          "w-[200px]",
          "h-full",
          "bg-base-300"
        ),
        list: tokens(
          "menu",
          "overflow-y-scroll",
          "flex-nowrap"
        )
      }
    end
  end
end
