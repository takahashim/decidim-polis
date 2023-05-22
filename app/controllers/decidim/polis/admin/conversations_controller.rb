# frozen_string_literal: true

module Decidim
  module Polis
    module Admin
      # Controller that allows managing the conversation of pol.is
      class ConversationsController < Decidim::Polis::Admin::ApplicationController
        def edit
          enforce_permission_to :update, :conversation

          @form = form(ConversationForm).from_model(conversation)
        end

        def update
          enforce_permission_to :update, :conversation
          @form = form(ConversationForm).from_params(params)

          UpdateConversation.call(conversation, @form) do
            on(:ok) do
              flash[:notice] = I18n.t("conversation.update.success", scope: "decidim.polis.admin")
              redirect_to parent_path
            end

            on(:invalid) do
              flash.now[:alert] = I18n.t("conversation.update.error", scope: "decidim.polis.admin")
              render :edit
            end
          end
        end

        private

        def conversation
          @conversation ||= Decidim::Polis::Conversation.find_by(component: current_component)
        end
      end
    end
  end
end
