# frozen_string_literal: true

module Features
  class Modals < ApplicationComponent
    def view_template
      div(class: "flex flex-wrap gap-sm") do
        render Protos::Modal.new do |c|
          c.trigger(id: "docs-modal-trigger", class: "btn btn-primary") do
            "Open Modal"
          end
          c.dialog do
            span { "This is the modal content." }
            c.close_button(id: "docs-modal-close", class: "btn") { "Close" }
          end
        end

        render Protos::Modal.new(close_on_backdrop_click: false) do |c|
          c.trigger(id: "docs-form-modal-trigger", class: "btn btn-secondary") do
            "Open Form Modal"
          end
          c.dialog do
            form do
              span { "This modal can only be closed with a button." }
              c.close_button(class: "btn") { "Cancel" }
            end
          end
        end
      end
    end
  end
end
