# frozen_string_literal: true

require "rails"
require "decidim/core"

module Decidim
  module Polis
    # This is the engine that runs on the public interface of polis.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::Polis

      routes do
        resources :polis, only: [:show]
        root to: "polis#show"
      end

      initializer "decidim_polis.webpacker.assets_path" do
        Decidim.register_assets_path File.expand_path("app/packs", root)
      end
    end
  end
end
