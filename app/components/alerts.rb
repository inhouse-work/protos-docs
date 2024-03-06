# frozen_string_literal: true

module Components
  class Alerts < Component
    def template
      render Protos::Alert.new do |_alert|
        "Hello world"
      end
    end
  end
end
