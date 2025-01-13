# frozen_string_literal: true

module Components
  class Feature < Component
    param :name

    def view_template
      div(**attrs) do
        render Demo.new(name)
        render FeatureCode.new(name, class: "hidden w-full")
      end
    end

    private

    def theme
      {
        container: %w[grid place-items-center w-full]
      }
    end
  end
end
