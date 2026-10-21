# frozen_string_literal: true

module Features
  class Tabs < ApplicationComponent
    VARIANTS = {
      default: :md,
      bordered: :md,
      boxed: :lg,
      lifted: :md
    }.freeze

    def view_template
      div(class: "flex flex-col gap-sm") do
        VARIANTS.each do |type, size|
          render Protos::Tabs.new(type:, size:) do |c|
            c.tab(active: true) { "Tab 1" }
            c.tab { "Tab 2" }
            c.tab { "Tab 3" }
            c.tab(disabled: true) { "Disabled" }
          end
        end
      end
    end

    private

    def theme
      {
        item: %w[
          rounded-box
          border
          p-sm
          bg-base-100
        ]
      }
    end
  end
end
