# frozen_string_literal: true

module Layouts
  class Site < Layout
    def template(&block)
      html do
        head do
          title { "Protos" }
          meta name: "viewport", content: "width=device-width,initial-scale=1"
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
