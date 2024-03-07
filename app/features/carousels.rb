module Features
  class Carousels < Component
    def template
      render Protos::Carousel.new(
        class: "rounded-box",
        snap_to: :end
      ) do |carousel|
        images.each do |image|
          render carousel.item do
            img(src: image, alt: "Random image")
          end
        end
      end
    end

    private

    def images
      [
        "https://daisyui.com/images/stock/photo-1559703248-dcaaec9fab78.jpg",
        "https://daisyui.com/images/stock/photo-1565098772267-60af42b81ef2.jpg",
        "https://daisyui.com/images/stock/photo-1572635148818-ef6fd45eb394.jpg",
        "https://daisyui.com/images/stock/photo-1494253109108-2e30c049369b.jpg",
        "https://daisyui.com/images/stock/photo-1550258987-190a2d41a8ba.jpg"
      ]
    end
  end
end
