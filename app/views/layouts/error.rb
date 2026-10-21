# frozen_string_literal: true

module Layouts
  class Error < ApplicationLayout
    option :title, default: -> { "Page not found | #{::Site.name}" }, reader: false
    option :robots, default: -> { "noindex, follow" }, reader: false

    def view_template(&block)
      main(class: "grid place-items-center h-[--main-scene]") do
        section(class: "flex flex-col place-items-center gap-sm", &block)
      end
    end

    private

    def head_options = { title: @title, robots: @robots }
  end
end
