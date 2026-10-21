# frozen_string_literal: true

class ApplicationLayout < ApplicationComponent
  def around_template
    doctype
    html lang: "en", data: { theme: "onedark" } do
      render Layouts::Head.new(**head_options)

      body do
        yield
        render UI::Footer.new(class: css[:footer])
      end
    end
  end

  def view_template(&block)
    main(**attrs, &block)
  end

  private

  # Override in layouts or views that need different document metadata.
  def head_options = {}
end
