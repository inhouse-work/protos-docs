# frozen_string_literal: true

module Components
  class Stage < Component
    param :title, reader: false

    def view_template(&)
      section(**attrs) do
        header(class: "flex justify-between gap-sm") do
          h2 { @title }
          toggle_button
        end

        div(class: css[:feature], &)
      end
    end

    private

    def default_attrs
      {
        data: { controller: "feature" }
      }
    end

    def toggle_button
      render Protos::Swap.new(
        class: "btn",
        data_action: "click->feature#toggle"
      ) do |swap|
        swap.on do
          "Example"
        end

        swap.off do
          "Code"
        end
      end
    end

    def theme
      {
        container: %w[overflow-x-auto space-y-sm p-md],
        feature: %w[
          relative
          rounded-box
          grid
          place-items-center
          min-h-[350px]
        ]
      }
    end
  end
end
