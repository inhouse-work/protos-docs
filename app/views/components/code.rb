# frozen_string_literal: true

module Components
  class Code < Component
    param :code, reader: false
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
      lexed = lexer.lex(@code)
      formatter.format(lexed)
    end

    def theme
      {
        container: %w[overflow-x-auto w-full],
        code: %w[highlight block bg-base-300 p-sm rounded-box]
      }
    end
  end
end
