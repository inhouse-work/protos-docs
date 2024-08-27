# frozen_string_literal: true

module Features
  class Timelines < ApplicationComponent
    def view_template
      events = [
        ["1984", "First Macintosh computer", false, true],
        ["1985", "First Windows computer", true, true],
        ["1998", "iMac", true, false]
      ]

      render Protos::Timeline.new do |c|
        events.each do |date, content, start, finish|
          c.item do
            hr(class: "bg-base-100") if start
            c.left do
              span(class: "badge badge-accent") { date }
            end
            c.center do
              div(class: "w-6 h-6") { icon("check-circle") }
            end
            c.right(class: "timeline-box") do
              span { content }
            end
            hr(class: "bg-base-100") if finish
          end
        end
      end
    end
  end
end
