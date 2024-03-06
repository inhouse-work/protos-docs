# frozen_string_literal: true

module Pages
  class Home < Page
    def template
      render Layouts::Site.new(
        class: tokens(
          "p-sm",
          "bg-base-300",
          "min-h-screen",
          "space-y-md"
        )
      ) do
        page_title { "Protos Components" }
        div do
          feature("Typography") { typography }
          feature("Buttons") { buttons }
          feature("Badges") { badges }
          feature("Combobox") { comboboxes }
          feature("Command") { commands }
          feature("Drawer") { drawers }
          feature("Modal") { modals }
          feature("Dropdown") { dropdowns }
          feature("Accordion") { accordions }
          feature("Alert") { alerts }
          feature("Avatar") { avatars }
          feature("Chat bubbles") { chat_bubbles }
          feature("Collapse") { collapses }
          feature("Lists") { lists }
          feature("Popovers") { popovers }
          feature("Tables") { tables }
          feature("Timelines") { timelines }
          feature("Breadcrumbs") { breadcrumbs }
          feature("Carousel") { carousel }
          feature("Card") { cards }
          feature("Hero") { heroes }
          feature("Stats") { stats }
          feature("Swap") { swaps }
          feature("Tabs") { tabs }
          feature("Toasts") { toasts }
        end
      end
    end

    private

    def page_title(&block)
      render Protos::Typography::Heading.new(size: :xl, class: "mb-sm"), &block
    end

    def feature(title, &block)
      section(
        id: title.downcase,
        class: "border border-base-100 p-sm overflow-x-scroll"
      ) do
        h2(class: "mb-sm") { title }
        div(class: "relative rounded-box p-sm grid place-items-center min-h-[350px]") do
          div(class: "mx-auto", &block)
        end
      end
    end

    def breadcrumbs
      render Components::Breadcrumbs.new
    end

    def carousel
      render Components::Carousels.new
    end

    def chat_bubbles
      render Components::ChatBubbles.new
    end

    def heroes
      render Components::Heroes.new
    end

    def stats
      render Components::Stats.new
    end

    def swaps
      render Components::Swaps.new
    end

    def tabs
      render Components::Tabs.new
    end

    def toasts
      span { "See the bottom right corner" }
      render Components::Toasts.new
    end

    def alerts
      render Components::Alerts.new
    end

    def accordions
      render Components::Accordions.new
    end

    def avatars
      render Components::Avatars.new
    end

    def badges
      render Components::Badges.new
    end

    def typography
      render Components::Typography.new
    end

    def buttons
      render Components::Buttons.new
    end

    def cards
      render Components::Cards.new
    end

    def collapses
      render Components::Collapses.new
    end

    def comboboxes
      render Components::Comboboxes.new
    end

    def commands
      render Components::Commands.new
    end

    def drawers
      render Components::Drawers.new
    end

    def dropdowns
      render Components::Dropdowns.new
    end

    def lists
      render Components::Lists.new
    end

    def modals
      render Components::Modals.new
    end

    def popovers
      render Components::Popovers.new
    end

    def tables
      render Components::Tables.new
    end

    def timelines
      render Components::Timelines.new
    end
  end
end
