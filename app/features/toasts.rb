module Features
  class Toasts < Component
    def template
      render Protos::Toast.new do |toast|
        render Protos::Alert.new(type: :success, class: "flex items-center flex-nowrap") do |alert|
          plain("Hey, how's it going?")
          render alert.actions(class: "inline-flex") do
            render toast.close_button do
              icon("x-circle")
            end
          end
        end
      end
    end
  end
end
