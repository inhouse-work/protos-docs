# frozen_string_literal: true

module UI
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
        container: %w[
          relative
          w-[200px]
          h-full
        ],
        list: %w[
          menu
          overflow-y-scroll
          flex-nowrap
          bg-base-300
        ]
      }
    end
  end
end
