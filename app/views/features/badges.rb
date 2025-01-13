# frozen_string_literal: true

module Features
  class Badges < ApplicationComponent
    def view_template
      ul(class: "flex flex-wrap gap-sm") do
        li {
          render(Protos::Badge.new { "Badge" })
        }
        li {
          render(Protos::Badge.new(type: :primary) { "Primary Badge" })
        }
        li {
          render(Protos::Badge.new(type: :secondary) { "Secondary Badge" })
        }
        li {
          render(Protos::Badge.new(type: :info) { "Info Badge" })
        }
        li {
          render(Protos::Badge.new(type: :success) { "Success Badge" })
        }
        li {
          render(Protos::Badge.new(type: :warning) { "Warning Badge" })
        }
        li {
          render(Protos::Badge.new(type: :error) { "Error Badge" })
        }
      end
    end
  end
end
