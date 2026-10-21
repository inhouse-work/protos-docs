# frozen_string_literal: true

module UI
  class Footer < Component
    def view_template
      footer(**attrs) do
        p(class: "opacity-80 text-sm") do
          plain "All rights reserved. © #{Time.now.year} #{Site.author} · "
          link_to("GitHub", Site.repository_url, class: "link")
        end
      end
    end

    private

    def theme
      {
        container: "flex justify-center w-full py-lg text-center bg-base-300"
      }
    end
  end
end
