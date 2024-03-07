module Features
  class Timelines < Component
    def template
      events = [
        ["1984", "First Macintosh computer", false, true],
        ["1985", "First Windows computer", true, true],
        ["1998", "iMac", true, false]
      ]

      render Protos::Timeline.new do |timeline|
        events.each do |date, content, divide_start, divide_finish|
          render timeline.item do
            hr(class: "bg-base-100") if divide_start
            render timeline.left do
              span(class: "badge badge-accent") { date }
            end
            render timeline.center do
              div(class: "w-6 h-6") { icon("check-circle") }
            end
            render timeline.right(class: "timeline-box") do
              span { content }
            end
            hr(class: "bg-base-100") if divide_finish
          end
        end
      end
    end
  end
end
