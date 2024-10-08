# frozen_string_literal: true

module Features
  class Toasts < ApplicationComponent
    def view_template
      render Protos::Toast.new do |toast|
        render Protos::Alert.new(
          type: :success,
          class: "flex items-center flex-nowrap"
        ) do |alert|
          plain("Hey, how's it going?")
          alert.actions(class: "inline-flex") do
            toast.close_button(id: "close") do
              icon("x-circle", variant: :outline)
            end
          end
        end
      end
    end
  end
end
