# frozen_string_literal: true

module Decidim
  module Polis
    module PolisHelper
      def avatar_url
        avatar_path = if current_user.presenter && current_user.presenter.respond_to?(:avatar_url)
                        current_user.presenter.avatar_url
                      else
                        ActionController::Base.helpers.asset_pack_path("media/images/default-avatar.svg")
                      end

        "https://#{current_organization.host}#{avatar_path}"
      end
    end
  end
end
