module Layouts
  class Docs < ApplicationLayout
    private

    def theme
      {
        container: "max-w-prose mx-auto my-md"
      }
    end
  end
end
