module Components
  class Tabs < Component
    def template
      render Protos::Tabs.new do |tabs|
        render tabs.tab("tabs", label: "Tab 1") do
          div(class: css[:item]) { "Content 1" }
        end
        render tabs.tab("tabs", label: "Tab 2") do
          div(class: css[:item]) { "Content 2" }
        end
        render tabs.tab("tabs", label: "Tab 3") do
          div(class: css[:item]) { "Content 3" }
        end
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
