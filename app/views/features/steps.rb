# frozen_string_literal: true

module Features
  class Steps < ApplicationComponent
    def view_template
      div(class: "flex flex-col gap-md w-full") do
        render Protos::Steps.new do |c|
          c.step(type: :primary) { "Register" }
          c.step(type: :secondary) { "Choose plan" }
          c.step(type: :accent) { "Purchase" }
          c.step { "Complete" }
        end

        render Protos::Steps.new(vertical: true) do |c|
          c.step(type: :success) { "Account created" }
          c.step(type: :info) { "Profile completed" }
          c.step { "Invite teammates" }
        end
      end
    end
  end
end
