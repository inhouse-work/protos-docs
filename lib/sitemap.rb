# frozen_string_literal: true

require "time"

# Builds a sitemap from the routes defined in config/routes.rb, skipping
# error pages and any paths that should not be indexed.
class Sitemap
  EXCLUDED_PATHS = %w[404 500].freeze

  def self.call(...) = new(...).call

  def initialize(router: Staticky.router, last_modified: nil)
    @router = router
    @last_modified = last_modified || source_last_modified
  end

  def call
    <<~XML
      <?xml version="1.0" encoding="UTF-8"?>
      <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
      #{entries}
      </urlset>
    XML
  end

  private

  def entries
    indexable_resources.map { |resource| entry(resource) }.join("\n")
  end

  def indexable_resources
    @router.resources.reject { |resource| EXCLUDED_PATHS.include?(resource.url) }
  end

  def entry(resource)
    <<~XML.chomp
        <url>
          <loc>#{Site.absolute_url(resource.url)}</loc>
          <lastmod>#{@last_modified.utc.iso8601}</lastmod>
        </url>
    XML
  end

  # Use the most recent source change rather than the build time so repeated
  # builds don't produce a different sitemap without any content changing.
  def source_last_modified
    files = Dir.glob(Staticky.root_path.join("{app,config,content}/**/*").to_s)
    files.filter_map { |file| File.mtime(file) if File.file?(file) }.max ||
      Time.now.utc
  end
end
