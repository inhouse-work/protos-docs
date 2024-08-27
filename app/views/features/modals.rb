# frozen_string_literal: true

module Features
  class Modals < ApplicationComponent
    def view_template
      render Protos::Modal.new do |c|
        c.trigger(id: "trigger", class: "btn btn-primary") { "Open Modal" }
        c.dialog do
          span { "This is the modal content." }
          c.close_button(id: "close", class: "btn") { "Close" }
        end
      end
    end
  end
end
