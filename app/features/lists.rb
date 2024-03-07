module Features
  class Lists < Component
    def template
      render Protos::List.new do |list|
        render list.item(class: "border p-sm") { "Item 1" }
        render list.item(class: "border p-sm") { "Item 2" }
        render list.item(class: "border p-sm") { "Item 3" }
      end
    end
  end
end
