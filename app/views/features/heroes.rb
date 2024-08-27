# frozen_string_literal: true

module Features
  class Heroes < ApplicationComponent
    include Protos::Typography

    def view_template
      render Protos::Hero.new(
        class: "h-96 rounded-box w-full",
        style: "background-image: url(#{asset_path("images/hero.webp")});"
      ) do |c|
        c.overlay(class: "opacity-90")
        c.content do
          h1(class: "text-white") { "Hello, world!" }
        end
      end
    end
  end
end
