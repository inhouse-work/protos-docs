# frozen_string_literal: true

module Features
  class Tables < ApplicationComponent
    def view_template
      render Protos::Table.new(
        size: :sm,
        striped: true,
        pin_rows: true,
        pin_columns: true
      ) do |c|
        c.caption(side: :top) { "Table Caption" }
        c.header do
          c.row do
            c.head(align: :left) { "Name" }
            c.head(align: :center) { "Age" }
            c.head(align: :right) { "Status" }
            c.head { "Location" }
          end
        end

        c.body do
          c.row do
            c.cell { "John Doe" }
            c.cell(align: :center) { "28" }
            c.cell(align: :right) do
              span(class: "badge badge-info") { "Active" }
            end
            c.cell { "North Pole" }
          end
          c.row do
            c.cell { "Jane Smith" }
            c.cell(align: :center) { "33" }
            c.cell(align: :right) do
              span(class: "badge badge-info") { "Active" }
            end
            c.cell { "South Pole" }
          end
        end

        c.footer do
          c.row do
            c.cell { "Total" }
            c.cell(align: :center) { "2" }
            c.cell(align: :right) { "Active" }
            c.cell { "" }
          end
        end
      end
    end
  end
end
