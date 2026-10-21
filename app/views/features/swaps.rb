# frozen_string_literal: true

module Features
  class Swaps < ApplicationComponent
    def view_template
      div(class: "flex flex-wrap items-center gap-md") do
        render Protos::Swap.new(
          class: "swap-lg",
          input_options: { id: "docs-swap" }
        ) do |c|
          c.on { icon("check-circle", size: :lg) }
          c.off { icon("x-circle", size: :lg) }
        end

        render Protos::Swap.new(class: "swap-rotate") do |c|
          c.on { icon("check", size: :lg) }
          c.off { icon("x-mark", size: :lg) }
        end
      end
    end
  end
end
