module Components
  class Swaps < Component
    def template
      render Protos::Swap.new do |swap|
        render swap.on do
          icon("check-circle", size: :lg)
        end

        render swap.off do
          icon("x-circle", size: :lg)
        end
      end
    end
  end
end
