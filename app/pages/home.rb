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
        class: css[:layout]
      ) do
        page_title { "Protos Components" }

        content
      end
    end

    private

    def content
      render Protos::Drawer.new(
        id: "main-drawer",
        class: "md:drawer-open border-y"
      ) do |drawer|
        render drawer.content do
          render drawer.trigger(class: css[:trigger]) do
            icon("bars-3")
          end

          features
        end

        render drawer.side do
          sidebar
        end
      end
    end

    def features
      ul(class: css[:list]) do
        FEATURES.each do |name|
          li do
            render Components::Feature.new(name)
          end
        end
      end
    end

    def sidebar
      render Components::Sidebar.new(FEATURES)
    end

    def page_title(&block)
      render Protos::Typography::Heading.new(
        size: :xl,
        class: "px-sm py-md",
        &block
      )
    end

    def theme
      {
        trigger: tokens(
          "fixed",
          "bottom-sm",
          "left-sm",
          "z-10",
          "btn",
          "btn-primary",
          "shadow-md",
          "md:hidden"
        ),
        list: tokens("mx-auto", "divide-y")
      }
    end
  end
end
