# frozen_string_literal: true

module Layouts
  class Site < Layout
    def view_template(&block)
      html lang: "en_US", data: { theme: "onedark" } do
        head do
          title { "Protos UI components" }
          meta property: "og:title", content: "Protos UI components"
          meta property: "og:type", content: "website"
          meta property: "og:locale", content: "en_US"
          meta name: "description",
               content: "Protos is a UI component library built with Phlex, " \
                        "Tailwindcss, and daisyUI."
          link rel: "canonical", href: "https://protos.inhouse.work"
          meta property: "og:url", content: "https://protos.inhouse.work"
          meta property: "og:site_name", content: "Protos"
          meta name: "twitter:card", content: "summary"
          meta property: "twitter:title", content: "Protos UI components"
          meta name: "twitter:site", content: "@nolantait"
          meta name: "twitter:creator", content: "@nolantait"

          meta name: "viewport",
               content: "width=device-width,initial-scale=1,viewport-fit=cover"
          meta name: "turbo-cache-control", content: "no-preview"
          meta name: "theme-color", content: "#61afef"
          meta name: "mobile-web-app-capable", content: "yes"
          meta name: "apple-touch-fullscreen", content: "yes"
          meta name: "apple-mobile-web-app-capable", content: "yes"
          meta name: "apple-mobile-web-app-status-bar-style", content: "default"
          meta name: "apple-mobile-web-app-title", content: "Protos"
          script(
            src: "https://cdn.usefathom.com/script.js",
            data: { site: "LODSSLWQ", turbo_track: "reload" },
            defer: true
          )
          vite_client_tag unless ENV["RACK_ENV"] == "production"
          vite_javascript_tag "application"
        end

        body do
          main(**attrs, &block)
        end
      end
    end
  end
end
