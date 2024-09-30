# frozen_string_literal: true

module Errors
  class ServiceError < ApplicationView
    include Protos::Typography

    def around_template(&block) = Layouts::Error.new(&block)

    def view_template
      h1 { "Something went wrong." }
      link_to("Back to home", Pages::Home, class: "link")
    end
  end
end
