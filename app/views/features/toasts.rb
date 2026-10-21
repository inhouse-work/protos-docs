# frozen_string_literal: true

module Features
  class Toasts < ApplicationComponent
    def view_template
      render Protos::Toast.new(position: :top_center) do |toast|
        render Protos::Alert.new(
          color: :success,
          class: "flex items-center flex-nowrap"
        ) do |alert|
          plain("Hey, how's it going?")
          alert.actions(class: "inline-flex") do
            toast.close_button(id: "docs-toast-close") do
              icon("x-circle", variant: :outline)
            end
          end
        end
      end
    end
  end
end
