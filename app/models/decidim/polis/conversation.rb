# frozen_string_literal: true

module Decidim
  module Polis
    # The data store for a Debate in the Decidim::Debates component. It stores a
    # title, description and any other useful information to render a custom
    # debate.
    class Conversation < Polis::ApplicationRecord
      include Decidim::Resourceable
      include Decidim::HasComponent
      include Decidim::Traceable
      include Decidim::Loggable
      include Decidim::TranslatableResource

    end
  end
end
