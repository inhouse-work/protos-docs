# frozen_string_literal: true

module Components
  class Feature < Component
    include Protos::Typography

    param :name
    option :inflector, default: -> { Dry::Inflector.new }
    option :formatter, default: -> { Rouge::Formatters::HTML.new }
    option :lexer, default: -> { Rouge::Lexers::Ruby.new }

    def template
      section(**attrs) do
        header(class: "flex justify-between gap-sm") do
          h2 { name }
          nav(class: "flex gap-2") do
            button(
              class: "btn",
              data: { action: "feature#openCode" }
            ) do
              "Code"
            end
            button(
              class: "btn",
              data: { action: "feature#openVisual" }
            ) do
              "Example"
            end
          end
        end
        div(class: css[:feature]) do
          div(
            class: "mx-auto",
            data: { feature_target: "visual" }
          ) do
            render Object.const_get(class_name).new
          end

          pre(
            class: "overflow-x-auto hidden w-full",
            data: { feature_target: "code" }
          ) do
            code(class: "highlight block bg-base-200 p-sm rounded-box") do
              unsafe_raw highlighted_code
            end
          end
        end
      end
    end

    private

    def highlighted_code
      code = File.read(
        "app/features/#{underscored_name}.rb"
      )

      lexed = lexer.lex(code)
      formatter.format(lexed)
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
          "border",
          "border-base-100",
          "p-sm",
          "overflow-x-scroll",
          "space-y-sm"
        ),
        feature: tokens(
          "relative",
          "rounded-box",
          "p-sm",
          "grid",
          "place-items-center",
          "min-h-[350px]"
        )
      }
    end
  end
end
