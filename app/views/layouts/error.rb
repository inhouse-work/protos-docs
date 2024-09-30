# frozen_string_literal: true

module Layouts
  class Error < ApplicationLayout
    def view_template(&block)
      div(class: "grid place-items-center h-[--main-scene]") do
        section(class: "flex flex-col place-items-center gap-sm", &block)
      end
    end
  end
end
