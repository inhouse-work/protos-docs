module Features
  class Stats < Component
    def template
      render Protos::Stats.new do |stats|
        render stats.stat do
          render(stats.title) { "Total orders" }
          render(stats.value) { "1,200" }
        end
        render stats.stat do
          render(stats.title) { "Total sales" }
          render(stats.value) { "$1,200.00" }
        end
        render stats.stat do
          render(stats.title) { "Avg. order value" }
          render(stats.value) { "$1.00" }
        end
      end
    end
  end
end
