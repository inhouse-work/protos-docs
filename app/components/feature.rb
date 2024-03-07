module Components
  class Feature < Component
    include Protos::Typography

    param :name

    def template
      section(id: name.downcase, **attrs) do
        h2 { name }
        div(class: css[:feature]) do
          div(class: "mx-auto") do
            render Object.const_get("Features::#{name.delete(" ")}").new
          end
        end
      end
    end

    private

    def theme
      {
        container: tokens(
          "border",
          "border-base-100",
          "p-sm",
          "overflow-x-scroll",
          "space-y-sm"
        ),
        feature: tokens(
          "relative",
          "rounded-box",
          "p-sm",
          "grid",
          "place-items-center",
          "min-h-[350px]"
        )
      }
    end
  end
end
