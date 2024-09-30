# frozen_string_literal: true

module UI
  class Table < ApplicationComponent
    include Protos::Typography
    include Phlex::DeferredRender

    class Column
      attr_reader :title

      def initialize(title, align: :left, &block)
        @title = title
        @align = align
        @block = block
      end

      def call(item)
        @block.call(item)
      end
    end

    option :title, default: -> { }, reader: false
    option :collection, default: -> { [] }, reader: false
    option :columns, default: -> { [] }, reader: false

    def view_template
      article(**attrs) do
        header class: css[:header] do
          h3(size: :md) { @title } if @title
        end

        render_table
      end
    end

    def with_column(...)
      @columns << Column.new(...)
    end

    def with_empty(&block)
      @empty = block
    end

    def with_caption(&block)
      @caption = block
    end

    private

    def render_table
      render Protos::Table.new(class: css[:table]) do |table|
        table.caption(class: css[:caption], &@caption) if @caption
        table.header do
          table.row do
            @columns.each do |column|
              if column == @columns.last
                table.head(align: :right) { plain(column.title) }
              else
                table.head { column.title }
              end
            end
          end
        end

        table.body do
          @collection.each do |item|
            table.row do
              @columns.each do |column|
                if column == @columns.last
                  table.cell(align: :right) { column.call(item) }
                else
                  table.cell { column.call(item) }
                end
              end
            end
          end

          if @collection.empty?
            table.row do
              table.cell(colspan: @columns.length) { @empty&.call }
            end
          end
        end
      end
    end

    def theme
      {
        container: "space-y-sm",
        header: %w[
          flex
          items-end
          gap-sm
        ],
        table: %w[
          border
          bg-base-100
          rounded-box
        ],
        caption: "text-muted"
      }
    end
  end
end
