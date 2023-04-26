# frozen_string_literal: true

module Decidim
  module Polis
    module PolisHelper
      def avatar_url
        avatar_path = if current_user.avatar.attached?
                        current_user.avatar.default_url
                      else
                        ActionController::Base.helpers.asset_pack_path("media/images/default-avatar.svg")
                      end

        "https://#{current_organization.host}#{avatar_path}"
      end
    end
  end
end
