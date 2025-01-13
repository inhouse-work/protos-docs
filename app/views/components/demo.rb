# frozen_string_literal: true

module Components
  class Demo < Component
    param :name
    option :inflector, default: -> { Dry::Inflector.new }

    def view_template
      div(class: "mx-auto", data: { feature_target: "visual" }) do
        render Object.const_get(class_name).new
      end
    end

    private

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
  end
end
