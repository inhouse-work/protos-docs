module Components
  class Code < Component
    param :filepath
    option :formatter, default: -> { Rouge::Formatters::HTML.new }
    option :lexer, default: -> { Rouge::Lexers::Ruby.new }

    def view_template
      pre(**attrs) do
        code(class: css[:code]) do
          unsafe_raw highlighted_code
        end
      end
    end

    private

    def highlighted_code
      code = File.read(filepath)
      lexed = lexer.lex(code)
      formatter.format(lexed)
    end

    def default_attrs
      {
        data: { feature_target: "code" }
      }
    end

    def theme
      {
        container: tokens("overflow-x-auto", "hidden", "w-full"),
        code: tokens("highlight", "block", "bg-base-300", "p-sm", "rounded-box")
      }
    end
  end
end
