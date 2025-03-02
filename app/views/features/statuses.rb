# frozen_string_literal: true

module Features
  class Statuses < ApplicationComponent
    def view_template
      ul(class: "flex flex-wrap gap-2") do
        li { status }
        li { status(type: :primary) }
        li { status(type: :secondary) }
        li { status(type: :info) }
        li { status(type: :success) }
        li { status(type: :warning) }
        li { status(type: :error) }
      end
    end

    private

    def status(type: :default, &)
      render Protos::Status.new(type: type, &)
    end
  end
end
