# frozen_string_literal: true

module Features
  class Swaps < ApplicationComponent
    def view_template
      render Protos::Swap.new do |c|
        c.on(id: "on", width: 5, height: 5) { icon("check-circle", size: :lg) }
        c.off(id: "off", width: 5, height: 5) { icon("x-circle", size: :lg) }
      end
    end
  end
end
