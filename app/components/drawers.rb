module Components
  class Drawers < Component
    def template
      render Protos::Drawer.new(id: "some_id") do |drawer|
        render drawer.content do
          render drawer.trigger(class: "btn btn-primary") { "Open Drawer" }
        end

        render drawer.side do
          ul(class: "menu p-4 w-80 min-h-full bg-base-200 text-base-content") do
            li do
              a { "Main Menu" }
            end
          end
        end
      end
    end
  end
end