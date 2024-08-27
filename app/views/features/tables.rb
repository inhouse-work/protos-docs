# frozen_string_literal: true

module Features
  class Tables < ApplicationComponent
    def view_template
      render Protos::Table.new do |c|
        c.caption { "Table Caption" }
        c.header do
          c.row do
            c.head { "Name" }
            c.head { "Age" }
            c.head { "Status" }
            c.head { "Location" }
          end
        end

        c.body do
          c.row do
            c.cell { "John Doe" }
            c.cell { "28" }
            c.cell do
              span(class: "badge badge-info") { "Active" }
            end
            c.cell { "North Pole" }
          end
          c.row do
            c.cell { "Jane Smith" }
            c.cell { "33" }
            c.cell { span(class: "badge badge-info") { "Active" } }
            c.cell { "South Pole" }
          end
        end
      end
    end
  end
end
