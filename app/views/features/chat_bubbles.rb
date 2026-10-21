# frozen_string_literal: true

module Features
  class ChatBubbles < ApplicationComponent
    def view_template
      ul(class: "space-y-md") do
        li do
          render Protos::ChatBubble.new do |c|
            c.image { img(src: "https://i.pravatar.cc/300", alt: "Robert", class: "w-10 rounded-full") }
            c.header { "Robert A. Caro" }
            c.content { "Hey, how's it going?" }
            c.footer { "12:45 PM" }
          end
        end

        li do
          render Protos::ChatBubble.new(align: :end) do |c|
            c.header { "You" }
            c.content(type: :primary) { "Pretty good, you?" }
            c.footer { "12:46 PM" }
          end
        end

        li do
          render Protos::ChatBubble.new(align: :end) do |c|
            c.content(type: :accent) { "See you tomorrow!" }
            c.footer { "12:47 PM" }
          end
        end
      end
    end
  end
end
