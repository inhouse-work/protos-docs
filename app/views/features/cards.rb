# frozen_string_literal: true

module Features
  class Cards < ApplicationComponent
    def view_template
      render Protos::Card.new(
        border: true,
        class: "bg-neutral text-neutral-content max-w-[300px]"
      ) do |c|
        c.image { img(src: image_url, alt: "Placeholder Image") }
        c.body do
          c.title { "Card Title" }
          p { "This is the card body" }
        end
      end
    end

    private

    def image_url
      "https://images.unsplash.com/photo-1709418359735-9cf3b793558d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    end
  end
end
