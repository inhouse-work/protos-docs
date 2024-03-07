module Features
  class Breadcrumbs < Component
    def template
      render Protos::Breadcrumbs.new do |crumbs|
        render crumbs.crumb do
          a(href: "#", class: "gap-2") do
            icon("home", size: :sm)
            span { "Home" }
          end
        end

        render crumbs.crumb do
          a(href: "#") { "Accounts" }
        end

        render crumbs.crumb do
          a(href: "#") { "Joe" }
        end

        render crumbs.crumb do
          plain("Edit")
        end
      end
    end
  end
end
