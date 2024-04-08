# frozen_string_literal: true

module Features
  class Typography < Component
    def view_template
      ul(class: "flex flex-col gap-xs") do
        li do
          render Protos::Typography::Heading.new(size: :xl) do
            "XL Hello, world!"
          end
        end

        li do
          render Protos::Typography::Heading.new(size: :lg) do
            "LG Hello, world!"
          end
        end

        li do
          render Protos::Typography::Heading.new(size: :md) do
            "MD Hello, world!"
          end
        end

        li do
          render Protos::Typography::Heading.new(size: :sm) do
            "SM Hello, world!"
          end
        end

        li do
          render Protos::Typography::Heading.new(size: :xs) do
            "XS Hello, world!"
          end
        end

        li do
          render Protos::Typography::Paragraph.new do
            "This is some paragraph text"
          end
        end
      end
    end
  end
end
