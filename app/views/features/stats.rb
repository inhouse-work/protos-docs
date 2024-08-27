# frozen_string_literal: true

module Features
  class Stats < ApplicationComponent
    def view_template
      render Protos::Stats.new do |c|
        c.stat do
          c.title { "Total orders" }
          c.value { "1,200" }
        end
        c.stat do
          c.title { "Total sales" }
          c.value { "$1,200" }
        end
        c.stat do
          c.title { "Avg. order value" }
          c.value { "$1.00" }
        end
      end
    end
  end
end
