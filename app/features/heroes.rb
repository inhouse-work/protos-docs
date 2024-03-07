module Features
  class Heroes < Component
    include Protos::Typography

    def template
      render Protos::Hero.new(
        class: "h-96 rounded-box",
        style: "background-image: url(https://daisyui.com/images/stock/photo-1559703248-dcaaec9fab78.jpg);"
      ) do |hero|
        render hero.overlay(class: "opacity-90")
        render hero.content do
          h1(class: "text-white") { "Hello, world!" }
        end
      end
    end
  end
end
