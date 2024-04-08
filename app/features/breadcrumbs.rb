# frozen_string_literal: true

module Features
  class Breadcrumbs < Component
    def view_template
      render Protos::Breadcrumbs.new do |c|
        c.crumb do
          a(href: "#", class: "gap-2") do
            icon("home", size: :sm)
            span { "Home" }
          end
        end

        c.crumb { a(href: "#") { "Accounts" } }
        c.crumb { a(href: "#") { "Joe" } }

        c.crumb do
          plain("Edit")
        end
      end
    end
  end
end
