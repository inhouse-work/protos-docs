# frozen_string_literal: true

module Features
  class Tabs < Component
    def view_template
      render Protos::Tabs.new do |c|
        c.tab(id: "tabs", label: "Tab 1", class: css[:item]) { "Content 1" }
        c.tab(id: "tabs", label: "Tab 2", class: css[:item]) { "Content 2" }
        c.tab(id: "tabs", label: "Tab 3", class: css[:item]) { "Content 3" }
      end
    end

    private

    def theme
      {
        item: tokens(
          "rounded-box",
          "border",
          "p-sm",
          "bg-base-100"
        )
      }
    end
  end
end
