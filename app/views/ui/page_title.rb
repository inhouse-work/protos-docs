module UI
  class PageTitle < ApplicationComponent
    include Protos::Typography
    include Phlex::DeferredRender

    param :title, reader: false
    option :subtitle, default: -> { }, reader: false
    option :breadcrumbs, default: -> { [] }, reader: false

    def view_template
      header(**attrs) do
        hgroup class: css[:hgroup] do
          render Ui::Breadcrumbs.new(@breadcrumbs) if @breadcrumbs.any?

          h1(size: :lg, class: css[:title]) do
            plain(@title)
            @extra&.call
          end

          h2(size: :xs, class: "text-muted", &@subtitle) if @subtitle
        end
      end
    end

    def with_extra(&block)
      @extra = block
    end

    def with_subtitle(&block)
      @subtitle = block
    end

    def with_action(*, **, &block)
      super(*, size: :sm, **, &block)
    end

    private

    def theme
      {
        container: %w[
          flex
          justify-between
          gap-sm
        ],
        title: %w[
          inline-flex
          items-baseline
          gap-xs
        ],
        actions: %w[
          inline-flex
          gap-2
        ],
        hgroup: "space-y-2"
      }
    end
  end
end
