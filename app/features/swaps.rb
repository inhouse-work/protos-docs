# frozen_string_literal: true

module Features
  class Swaps < Component
    def view_template
      render Protos::Swap.new do |c|
        c.on do
          icon("check-circle", size: :lg)
        end

        c.off do
          icon("x-circle", size: :lg)
        end
      end
    end
  end
end
