module Pages
  module Docs
    class Buttons < ApplicationView
      Variant = Data.define(:attribute, :type, :description)

      # rubocop:disable Layout/LineLength
      VARIANTS = [
        Variant.new(:type, :primary, "A primary button indicates the main action."),
        Variant.new(:type, :secondary, "A secondary button indicates a secondary action."),
        Variant.new(:type, :info, "An info button indicates an informative action."),
        Variant.new(:type, :success, "A success button indicates a successful action."),
        Variant.new(:type, :warning, "A warning button indicates a warning action."),
        Variant.new(:type, :error, "An error button indicates an error action."),
        Variant.new(:type, :ghost, "A ghost button indicates a neutral action."),
        Variant.new(:type, :link, "A link button indicates a navigational action."),
        Variant.new(:type, :outline, "An outline button indicates a neutral action."),
        Variant.new(:type, :active, "An active button indicates a selected action."),
        Variant.new(:type, :disabled, "A disabled button indicates an inactive action."),
        Variant.new(:type, :glass, "A glass button indicates a transparent action."),
        Variant.new(:size, :xs, "An extra small button indicates a minimal action."),
        Variant.new(:size, :sm, "A small button indicates a compact action."),
        Variant.new(:size, :md, "A medium button indicates a standard action."),
        Variant.new(:size, :lg, "A large button indicates a prominent action."),
        Variant.new(:shape, :wide, "A wide button indicates a horizontal action."),
        Variant.new(:shape, :circle, "A circle button indicates a circular action."),
        Variant.new(:shape, :square, "A square button indicates a square action.")
      ].freeze
      # rubocop:enable Layout/LineLength

      def around_template(&block) = render Layouts::Docs.new(&block)

      def view_template
        page_title("Button") do |title|
          title.with_subtitle do
            "Buttons allow the user to take actions or make choices."
          end
        end

        render UI::Table.new(collection: VARIANTS) do |table|
          table.with_column("Type") do |variant|
            "new(#{variant.attribute}: :#{variant.type})"
          end

          table.with_column("Attribute") do |variant|
            render Protos::Badge.new do
              variant.attribute
            end
          end

          table.with_column("Description", &:description)
        end
      end
    end
  end
end
