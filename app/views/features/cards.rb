# frozen_string_literal: true

module Features
  class Cards < ApplicationComponent
    def view_template
      div(class: "flex flex-wrap gap-md items-stretch justify-center") do
        card(
          border: true,
          class: "bg-neutral text-neutral-content max-w-[300px]"
        )

        card(
          image_side: true,
          border: true,
          class: "bg-base-100 max-w-[500px]",
          image_class: "w-32"
        )

        card(
          dashed: true,
          border: true,
          class: "bg-base-100 max-w-[300px]"
        )

        card(
          image_full: true,
          size: :sm,
          class: "bg-neutral text-neutral-content max-w-[300px]"
        )
      end
    end

    private

    def card(image_class: nil, **)
      render Protos::Card.new(**) do |c|
        c.image { img(src: image_url, alt: "Placeholder Image", class: image_class) }
        c.body do
          c.title { "Card Title" }
          p { "This is the card body" }
          c.actions do
            button(class: "btn btn-primary btn-sm") { "Action" }
          end
        end
      end
    end

    def image_url
      "https://images.unsplash.com/photo-1709418359735-9cf3b793558d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    end
  end
end
