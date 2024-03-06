module Components
  class Tables < Component
    def template
      render Protos::Table.new do |table|
        render(table.caption) { "Table Caption" }
        render table.header do
          render table.row do
            render(table.head) { "Name" }
            render(table.head) { "Age" }
            render(table.head) { "Status" }
            render(table.head) { "Location" }
          end
        end
        render table.body do
          render table.row do
            render(table.cell) { "John Doe" }
            render(table.cell) { "28" }
            render(table.cell) do
              span(class: "badge badge-info") { "Active" }
            end
            render(table.cell) { "North Pole" }
          end
          render table.row do
            render(table.cell) { "Jane Smith" }
            render(table.cell) { "33" }
            render(table.cell) do
              span(class: "badge badge-info") { "Active" }
            end
            render(table.cell) { "South Pole" }
          end
        end
      end
    end
  end
end
