# frozen_string_literal: true

module Pages
  class NotFound < Page
    def view_template
      render Layouts::Site.new do
        h1 { "Page not found." }
      end
    end
  end
end
