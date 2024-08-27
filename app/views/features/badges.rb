# frozen_string_literal: true

module Features
  class Badges < ApplicationComponent
    def view_template
      ul(class: "flex flex-wrap gap-sm") do
        li { span(class: "badge") { "Badge" } }
        li { span(class: "badge badge-primary") { "Primary Badge" } }
        li { span(class: "badge badge-secondary") { "Secondary Badge" } }
        li { span(class: "badge badge-info") { "Info Badge" } }
        li { span(class: "badge badge-success") { "Success Badge" } }
        li { span(class: "badge badge-warning") { "Warning Badge" } }
        li { span(class: "badge badge-error") { "Error Badge" } }
      end
    end
  end
end
