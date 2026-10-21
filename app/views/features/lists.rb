# frozen_string_literal: true

module Features
  class Lists < ApplicationComponent
    def view_template
      div(class: "flex flex-col gap-sm w-full") do
        render Protos::List.new do |c|
          c.item { "Item 1" }
          c.item { "Item 2" }
          c.item { "Item 3" }
        end

        render Protos::List.new(ordered: true, class: "bg-base-200 rounded-box") do |c|
          c.item { "First item" }
          c.item { "Second item" }
          c.item { "Third item" }
        end

        render Protos::List.new(class: "bg-base-200 rounded-box") do |c|
          c.item(wrap: true) { "Wrapped item content" }
          c.item(grow: true) { "Growing item content" }
        end
      end
    end
  end
end
