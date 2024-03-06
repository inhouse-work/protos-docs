# frozen_string_literal: true

module Components
  class Avatars < Component
    def template
      div(class: "flex gap-sm items-center") do
        with_placeholder
        with_image
      end
    end

    private

    def with_image
      render Protos::Avatar.new(
        indicator: "online",
        shape: "circle",
        theme: { figure: "bg-base-content text-neutral w-12" }
      ) do |c|
        c.img(src: "https://i.pravatar.cc/300", alt: "NT")
      end
    end

    def with_placeholder
      render Protos::Avatar.new(
        placeholder: true,
        class: "text-base-100",
        shape: :circle,
        theme: { figure: "p-sm bg-base-content" }
      ) do |avatar|
        avatar.plain("NT")
      end
    end
  end
end
