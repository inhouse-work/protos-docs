# frozen_string_literal: true

module Features
  class ChatBubbles < Component
    def view_template
      ul class: "space-y-md" do
        li do
          render Protos::ChatBubble.new do |c|
            c.header { "Robert A. Caro" }
            c.content { "Hey, how's it going?" }
          end
        end

        li do
          render Protos::ChatBubble.new(align: :end) do |c|
            c.header { "You" }
            c.content(type: :primary) { "Pretty good, you?" }
          end
        end
      end
    end
  end
end
