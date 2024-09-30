# frozen_string_literal: true

require "date"

Staticky.router.define do
  root to: Pages::Home
  match "404", to: Errors::NotFound
  match "500", to: Errors::ServiceError

  match "docs/buttons", to: Pages::Docs::Buttons
end
