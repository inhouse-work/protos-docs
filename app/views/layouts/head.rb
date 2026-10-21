# frozen_string_literal: true

require "json"

module Layouts
  class Head < ApplicationComponent
    option :title, default: -> { ::Site.title }, reader: false
    option :description, default: -> { ::Site.description }, reader: false
    option :robots,
      default: -> { "index, follow, max-image-preview:large" },
      reader: false
    option :image, default: -> { ::Site.image }, reader: false

    def view_template
      head do
        meta charset: "utf-8"
        meta name: "viewport",
          content: "width=device-width,initial-scale=1,viewport-fit=cover"
        title { @title }
        meta name: "description", content: @description
        meta name: "robots", content: @robots
        meta name: "author", content: ::Site.author
        meta name: "application-name", content: ::Site.name
        meta name: "theme-color", content: "#61afef"
        meta name: "color-scheme", content: "dark light"

        link rel: "canonical", href: canonical_url if indexable?
        link rel: "apple-touch-icon", href: "/apple-touch-icon.png"
        link rel: "icon",
          type: "image/png",
          sizes: "32x32",
          href: "/favicon-32x32.png"
        link rel: "icon",
          type: "image/png",
          sizes: "16x16",
          href: "/favicon-16x16.png"
        link rel: "manifest", href: "/site.webmanifest"

        meta name: "mobile-web-app-capable", content: "yes"
        meta name: "apple-mobile-web-app-capable", content: "yes"
        meta name: "apple-touch-fullscreen", content: "yes"
        meta name: "apple-mobile-web-app-status-bar-style", content: "default"
        meta name: "apple-mobile-web-app-title", content: ::Site.name

        open_graph_metadata
        twitter_metadata
        structured_data if indexable?

        meta name: "turbo-cache-control", content: "no-preview"
        meta name: "turbo-refresh-method", content: "morph"
        meta name: "turbo-refresh-scroll", content: "preserve"

        vite_client_tag unless ENV["RACK_ENV"] == "production"
        stylesheet_tag "stylesheets/site"
        stylesheet_tag "stylesheets/syntax"
        javascript_tag "application"

        script(
          src: "https://cdn.usefathom.com/script.js",
          data: { site: "LODSSLWQ", turbo_track: "reload" },
          defer: true
        )

        yield if block_given?
      end
    end

    private

    def indexable? = !@robots.include?("noindex")

    def canonical_url
      return ::Site.url unless indexable?

      ::Site.absolute_url(helpers.current_path)
    end

    def absolute_image_url
      ::Site.absolute_url(@image)
    end

    def open_graph_metadata
      meta property: "og:title", content: @title
      meta property: "og:description", content: @description
      meta property: "og:type", content: "website"
      meta property: "og:locale", content: "en_US"
      meta property: "og:url", content: canonical_url
      meta property: "og:site_name", content: ::Site.name
      meta property: "og:image", content: absolute_image_url
      meta property: "og:image:secure_url", content: absolute_image_url
      meta property: "og:image:type", content: ::Site.image_type
      meta property: "og:image:width", content: ::Site.image_width.to_s
      meta property: "og:image:height", content: ::Site.image_height.to_s
      meta property: "og:image:alt", content: ::Site.image_alt
    end

    def twitter_metadata
      meta name: "twitter:card", content: "summary_large_image"
      meta name: "twitter:title", content: @title
      meta name: "twitter:description", content: @description
      meta name: "twitter:image", content: absolute_image_url
      meta name: "twitter:image:alt", content: ::Site.image_alt
      meta name: "twitter:url", content: canonical_url

      return if ::Site.twitter.empty?

      meta name: "twitter:site", content: ::Site.twitter
      meta name: "twitter:creator", content: ::Site.twitter
    end

    def structured_data
      script(type: "application/ld+json") do
        raw safe(JSON.generate(structured_data_json))
      end
    end

    def structured_data_json
      [
        {
          "@context" => "https://schema.org",
          "@type" => "WebSite",
          "name" => ::Site.name,
          "alternateName" => "Protos UI Components",
          "url" => ::Site.url,
          "description" => ::Site.description,
          "inLanguage" => "en",
          "publisher" => {
            "@type" => "Organization",
            "name" => ::Site.author,
            "url" => "https://inhouse.work",
            "logo" => ::Site.absolute_url("/android-chrome-512x512.png")
          }
        },
        {
          "@context" => "https://schema.org",
          "@type" => "SoftwareApplication",
          "name" => "Protos UI Components",
          "applicationCategory" => "DeveloperApplication",
          "operatingSystem" => "Any",
          "description" => ::Site.description,
          "url" => ::Site.url,
          "image" => absolute_image_url,
          "license" => "https://opensource.org/licenses/MIT",
          "codeRepository" => ::Site.repository_url,
          "offers" => {
            "@type" => "Offer",
            "price" => "0",
            "priceCurrency" => "USD"
          }
        }
      ]
    end

    def javascript_tag(...)
      vite_javascript_tag(...)
    end

    def stylesheet_tag(...)
      vite_stylesheet_tag(...)
    end
  end
end
