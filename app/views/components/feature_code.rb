# frozen_string_literal: true

module Components
  class FeatureCode < Component
    param :name, reader: false
    option :inflector, default: -> { Dry::Inflector.new }

    def view_template
      render Code.new(code, **attrs)
    end

    private

    def filepath
      "app/views/features/#{underscored_name}.rb"
    end

    def underscored_name
      inflector.underscore(@name.delete(" "))
    end

    def default_attrs
      {
        data: { feature_target: "code" }
      }
    end

    def code
      File.read(filepath)
    end
  end
end
