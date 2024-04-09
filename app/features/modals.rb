# frozen_string_literal: true

module Features
  class Modals < Component
    def view_template
      render Protos::Modal.new do |c|
        c.trigger(class: "btn btn-primary") { "Open Modal" }
        c.dialog do
          span { "This is the modal content." }
          c.close_button(class: "btn") { "Close" }
        end
      end
    end
  end
end
