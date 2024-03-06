module Components
  class Toasts < Component
    def template
      render Protos::Toast.new do |toast|
        render Protos::Alert.new(type: :success) do |alert|
          span { "Hey, how's it going?" }
          render alert.actions do
            render toast.close_button do
              icon("x-circle")
            end
          end
        end
      end
    end
  end
end
