# frozen_string_literal: true

module Features
  class Lists < ApplicationComponent
    def view_template
      render Protos::List.new do |c|
        c.item { "Item 1" }
        c.item { "Item 2" }
        c.item { "Item 3" }
      end
    end
  end
end
