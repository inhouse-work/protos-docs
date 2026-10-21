# frozen_string_literal: true

module Features
  class Stats < ApplicationComponent
    def view_template
      render Protos::Stats.new(class: "shadow") do |c|
        c.stat do
          c.title { "Total orders" }
          c.value { "1,200" }
          c.description { "21% more than last month" }
        end

        c.stat do
          c.figure { icon("chart-bar") }
          c.title { "Total sales" }
          c.value { "$1,200" }
          c.description { "Jan 1st - Feb 1st" }
          c.actions do
            button(class: "btn btn-xs") { "View report" }
          end
        end

        c.stat do
          c.title { "Avg. order value" }
          c.value { "$1.00" }
        end
      end
    end
  end
end
