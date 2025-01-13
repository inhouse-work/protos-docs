# frozen_string_literal: true

module Components
  class Feature < Component
    param :name

    def view_template
      div(**attrs) do
        render Demo.new(name)
        render Code.new(name, class: "hidden")
      end
    end

    private

    def default_attrs
      {
        id: name.downcase
      }
    end

    def theme
      {
        container: %w[
          overflow-x-auto
          space-y-sm
          p-md
        ]
      }
    end
  end
end
