class ApplicationView < ApplicationComponent
  def page_title(...)
    render UI::PageTitle.new(...)
  end

  def around_template(&block)
    render ApplicationLayout.new(class: css[:layout], &block)
  end
end
