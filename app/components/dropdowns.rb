module Components
  class Dropdowns < Component
    def template
      render Protos::Dropdown.new do |dropdown|
        render dropdown.trigger(class: "btn btn-primary") { "Open" }
        render dropdown.menu(class: "w-52") do
          render(dropdown.item) { a { "Item 1" } }
          render(dropdown.item) { a { "Item 2" } }
        end
      end
    end
  end
end
