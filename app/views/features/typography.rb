# frozen_string_literal: true

module Features
  class Typography < ApplicationComponent
    include Protos::Typography
    # This will override h1-h4 + p and add inline_a

    def view_template
      ul class: "flex flex-col gap-xs" do
        li { h1(size: :xl) { "XL Hello, world!" } }
        li { h2(size: :lg) { "XL Hello, world!" } }
        li { h3(size: :md) { "Hello, world!" } }
        li { h4(size: :sm) { "Hello, world!" } }
        li { h4(size: :xs) { "Hello, world!" } }
        li do
          plain "This is some paragraph text "
          inline_a(href: "https://example.com") { "with an inline link" }
        end
      end
    end
  end
end
