module Components
  class Modals < Component
    def template
      render Protos::Modal.new do |modal|
        render modal.trigger(class: "btn btn-primary") { "Open Modal" }
        render modal.dialog do
          p { "This is the modal content." }
          render modal.close_button(class: "btn") { "Close" }
        end
      end
    end
  end
end
