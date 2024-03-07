# frozen_string_literal: true

module Pages
  class Home < Page
    FEATURES = [
      "Typography",
      "Buttons",
      "Badges",
      "Comboboxes",
      "Commands",
      "Drawers",
      "Modals",
      "Dropdowns",
      "Accordions",
      "Alerts",
      "Avatars",
      "Chat Bubbles",
      "Collapses",
      "Lists",
      "Popovers",
      "Tables",
      "Timelines",
      "Breadcrumbs",
      "Carousels",
      "Cards",
      "Heroes",
      "Stats",
      "Swaps",
      "Tabs",
      "Toasts"
    ].freeze

    def template
      render Layouts::Site.new(
        class: tokens(
          "p-sm",
          "bg-base-300",
          "min-h-screen",
          "space-y-md"
        )
      ) do
        page_title { "Protos Components" }

        render Protos::Drawer.new(id: "main-drawer", class: "md:drawer-open") do |drawer|
          render drawer.content do
            render drawer.trigger(
              class: "fixed bottom-sm z-10 btn btn-primary md:hidden"
            ) do
              icon("bars-3")
            end
            features
          end

          render drawer.side do
            sidebar
          end
        end
      end
    end

    private

    def features
      ul(class: "mx-auto") do
        FEATURES.each do |name|
          li do
            render Components::Feature.new(name)
          end
        end
      end
    end

    def sidebar
      aside(class: "relative w-[200px] h-full bg-base-100") do
        nav do
          ul(class: "menu overflow-y-scroll flex-nowrap") do
            FEATURES.each do |name|
              li do
                a(href: "##{name.downcase}") { name }
              end
            end
          end
        end
      end
    end

    def page_title(&block)
      render Protos::Typography::Heading.new(size: :xl, class: "mb-sm"), &block
    end
  end
end
