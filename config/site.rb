# frozen_string_literal: true

module Site
  module_function

  def name = "Protos"

  def title = "Protos UI Components. Phlex, Tailwind CSS & DaisyUI"

  def description
    "Protos is an open-source UI component library for Ruby. Browse 30+ " \
      "accessible, copy-paste-ready components built with Phlex, Tailwind CSS " \
      "and DaisyUI."
  end

  # Add a Twitter/X handle (e.g. "@protos") to emit twitter:site and
  # twitter:creator tags.
  def twitter = ""

  def url = "https://protos.inhouse.work"
  def repository_url = "https://github.com/inhouse-work/protos"
  def author = "inhouse.work"

  def image = "/og-image.jpg"
  def image_alt = "Protos UI Components. UI components for Phlex"
  def image_type = "image/jpeg"
  def image_width = 1200
  def image_height = 630

  def url_for(path) = URI.join(url, path)
  def absolute_url(path) = url_for(path).to_s
end
