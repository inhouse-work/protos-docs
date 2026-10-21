# frozen_string_literal: true

module Errors
  class NotFound < ApplicationView
    include Protos::Typography

    def around_template(&block)
      render Layouts::Error.new(
        title: "Page not found | #{Site.name}",
        &block
      )
    end

    def view_template
      h1 { "Page not found." }
      link_to("Back to home", Pages::Home, class: "link")
    end
  end
end
