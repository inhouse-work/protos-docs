module Components
  class Popovers < Component
    def template
      render Protos::Popover.new do |popover|
        render popover.trigger(class: "btn btn-primary") { "Open Popover" }
        render popover.content(class: "rounded-box border p-sm mt-sm bg-base-100") do
          p { "This is the popover content." }
        end
      end
    end
  end
end
