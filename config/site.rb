# frozen_string_literal: true

module Site
  module_function

  def title = "Protos UI Components"

  def description
    "Protos is a UI component library built with Phlex, TailwindCSS and DaisyUI"
  end

  def twitter = ""
  def url = "https://protos.inhouse.work"

  def url_for(path) = URI.join(url, path)
end
