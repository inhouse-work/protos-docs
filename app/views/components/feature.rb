# frozen_string_literal: true

module Components
  class Feature < Component
    include Protos::Typography

    param :name
    option :inflector, default: -> { Dry::Inflector.new }

    def view_template
      section(**attrs) do
        header(class: "flex justify-between gap-sm") do
          h2 { name }
          toggle_button
        end
        div(class: css[:feature]) do
          div(
            class: "mx-auto",
            data: { feature_target: "visual" }
          ) do
            render Object.const_get(class_name).new
          end

          render Components::Code.new(filepath)
        end
      end
    end

    private

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

    def filepath
      "app/views/features/#{underscored_name}.rb"
    end

    def default_attrs
      {
        id: name.downcase,
        data: { controller: "feature" }
      }
    end

    def class_name
      inflector.camelize("features/#{underscored_name}")
    end

    def underscored_name
      inflector.underscore(name.delete(" "))
    end

    def theme
      {
        container: tokens(
          "overflow-x-auto",
          "space-y-sm",
          "p-md"
        ),
        feature: tokens(
          "relative",
          "rounded-box",
          "grid",
          "place-items-center",
          "min-h-[350px]"
        )
      }
    end
  end
end
