# frozen_string_literal: true

module Features
  class Typography < ApplicationComponent
    include Protos::Typography
    # This will override h1-h4 + p and add inline_a

    def view_template
      ul(class: "flex flex-col gap-xs") do
        li { h1(size: :xl) { "XL Hello, world!" } }
        li { h2(size: :lg) { "LG Hello, world!" } }
        li { h3(size: :md) { "MD Hello, world!" } }
        li { h4(size: :sm) { "SM Hello, world!" } }
        li { h4(size: :xs) { "XS Hello, world!" } }
        li do
          render Protos::Typography::Heading.new(level: 5, size: :sm) do
            "H5 Hello, world!"
          end
        end
        li do
          render Protos::Typography::Heading.new(level: 6, size: :xs) do
            "H6 Hello, world!"
          end
        end
        li do
          plain "This is some paragraph text "
          inline_a(href: "https://example.com") { "with an inline link" }
        end
        li { p(margin: false) { "Paragraph without a top margin" } }
      end
    end
  end
end
