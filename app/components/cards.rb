# frozen_string_literal: true

module Components
  class Cards < Component
    def template
      render Protos::Card.new(
        border: true,
        class: "bg-base-content text-neutral max-w-[300px]"
      ) do |card|
        render card.image do
          img(
            src: "https://images.unsplash.com/photo-1709418359735-9cf3b793558d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            alt: "Placeholder Image"
          )
        end
        render card.body do
          render(
            card.title do
              "Card Title"
            end
          )
          p do
            "This is the card body"
          end
        end
      end
    end
  end
end
