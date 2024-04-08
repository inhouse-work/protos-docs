# frozen_string_literal: true

module Features
  class Badges < Component
    def view_template
      ul(class: "flex flex-wrap gap-sm") do
        li do
          span(class: "badge") { "Badge" }
        end

        li do
          span(class: "badge badge-primary") { "Primary Badge" }
        end

        li do
          span(class: "badge badge-secondary") { "Secondary Badge" }
        end

        li do
          span(class: "badge badge-info") { "Tertiary Badge" }
        end

        li do
          span(class: "badge badge-success") { "Success Badge" }
        end

        li do
          span(class: "badge badge-warning") { "Warning Badge" }
        end

        li do
          span(class: "badge badge-error") { "Error Badge" }
        end
      end
    end
  end
end
