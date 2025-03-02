# frozen_string_literal: true

module Pages
  class Home < ApplicationView
    FEATURES = [
      "Typography",
      "Buttons",
      "Badges",
      "Statuses",
      "Comboboxes",
      "Commands",
      "Drawers",
      "Modals",
      "Diffs",
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

    def view_template
      h1(class: "py-md px-sm") { "Protos Components" }
      content
    end

    private

    def content
      render Protos::Drawer.new(
        id: "main-drawer",
        class: "md:drawer-open border-y"
      ) do |drawer|
        drawer.content do
          drawer.trigger(class: css[:trigger]) do
            icon("bars-3")
          end

          features
        end

        drawer.side do
          sidebar
        end
      end
    end

    def features
      ul(class: css[:list]) do
        FEATURES.each do |name|
          li do
            render Components::Stage.new(name) do
              render Components::Feature.new(name)
            end
          end
        end
      end
    end

    def sidebar
      render UI::Sidebar.new(FEATURES)
    end

    def theme
      {
        trigger: [
          "fixed",
          "bottom-sm",
          "left-sm",
          "z-10",
          "btn",
          "btn-primary",
          "shadow-md",
          "md:hidden"
        ],
        list: "mx-auto divide-y"
      }
    end
  end
end
