# frozen_string_literal: true

module Features
  class Menus < ApplicationComponent
    def view_template
      div(class: "flex flex-wrap items-start gap-md") do
        render Protos::Menu.new(class: "bg-base-200 rounded-box w-56") do |c|
          c.item(title: true) { "Navigation" }
          c.item { a(href: "#") { "Home" } }
          c.item { a(href: "#") { "Projects" } }
          c.item { a(href: "#") { "Settings" } }
        end

        render Protos::Menu.new(
          direction: :horizontal,
          size: :lg,
          class: "bg-base-200 rounded-box"
        ) do |c|
          c.item { a(href: "#") { "Overview" } }
          c.item { a(href: "#") { "Activity" } }
          c.item { a(href: "#") { "Members" } }
        end
      end
    end
  end
end
