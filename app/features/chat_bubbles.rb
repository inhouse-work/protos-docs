module Features
  class ChatBubbles < Component
    def template
      ul class: "space-y-md" do
        li do
          render Protos::ChatBubble.new do |bubbles|
            render bubbles.content do
              plain("Hey, how's it going?")
            end
          end
        end

        li do
          render Protos::ChatBubble.new(align: :end) do |bubbles|
            render bubbles.content(type: :primary) do
              plain("Pretty good, you?")
            end
          end
        end
      end
    end
  end
end
