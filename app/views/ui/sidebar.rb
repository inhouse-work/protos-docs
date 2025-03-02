# frozen_string_literal: true

module UI
  class Sidebar < Component
    param :features

    def view_template
      aside(**attrs) do
        nav do
          ul(class: css[:list]) do
            features.each do |name|
              id = name.downcase.gsub(/\s/, "-")

              li do
                a(href: "##{id}") { name }
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
