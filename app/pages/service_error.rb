# frozen_string_literal: true

module Pages
  class ServiceError < Page
    def view_template
      render Layouts::Site.new do
        h1 { "Something went wrong." }
      end
    end
  end
end
