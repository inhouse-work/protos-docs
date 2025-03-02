# frozen_string_literal: true

module Features
  class Badges < ApplicationComponent
    def view_template
      ul(class: "flex flex-wrap gap-sm") do
        li { badge { "Badge" } }
        li { badge(type: :primary) { "Primary Badge" } }
        li { badge(type: :secondary) { "Secondary Badge" } }
        li { badge(type: :info) { "Info Badge" } }
        li { badge(type: :success) { "Success Badge" } }
        li { badge(type: :warning) { "Warning Badge" } }
        li { badge(type: :error) { "Error Badge" } }
      end
    end

    private

    def badge(type: :default, &)
      render(Protos::Badge.new(type: type, &))
    end
  end
end
