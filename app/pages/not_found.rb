# frozen_string_literal: true

module Pages
  class NotFound < Page
    def template
      render Layouts::Site.new do
        h1 { "Page not found." }
      end
    end
  end
end
