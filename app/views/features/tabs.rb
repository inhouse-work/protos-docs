# frozen_string_literal: true

module Features
  class Tabs < ApplicationComponent
    def view_template
      render Protos::Tabs.new do |c|
        c.tab { "Tab 1" }
        c.tab { "Tab 2" }
      end
    end

    private

    def theme
      {
        item: %w[
          rounded-box
          border
          p-sm
          bg-base-100
        ]
      }
    end
  end
end
