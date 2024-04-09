# frozen_string_literal: true

module Features
  class Swaps < Component
    def view_template
      render Protos::Swap.new do |c|
        c.on { icon("check-circle", size: :lg) }
        c.off { icon("x-circle", size: :lg) }
      end
    end
  end
end
