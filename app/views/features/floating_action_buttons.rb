# frozen_string_literal: true

module Features
  class FloatingActionButtons < ApplicationComponent
    def view_template
      div(class: "flex flex-wrap items-center justify-center gap-xl") do
        render Protos::FloatingActionButton.new(class: "relative") do |c|
          c.open_button(class: "btn-primary btn-circle") { icon("plus") }
          c.action(class: "btn btn-secondary btn-circle") { icon("pencil") }
          c.action(class: "btn btn-error btn-circle") { icon("trash") }
        end

        render Protos::FloatingActionButton.new(
          flower: true,
          class: "relative"
        ) do |c|
          c.open_button(class: "btn-primary btn-circle") { icon("plus") }
          c.main_action(class: "btn btn-primary btn-circle") { icon("x-mark") }
          c.action(class: "btn btn-secondary btn-circle") { icon("pencil") }
          c.action(class: "btn btn-error btn-circle") { icon("trash") }
        end
      end
    end
  end
end
