module Features
  class Collapses < Component
    def template
      render Protos::Collapse.new(class: "border") do |collapse|
        render(collapse.title) { "Toggle" }
        render collapse.content do
          p do
            "This is the collapse content"
          end
        end
      end
    end
  end
end
