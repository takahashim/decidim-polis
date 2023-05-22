# frozen_string_literal: true

module Decidim
  module Polis
    module Admin
      # A command with all the business logic for updating the current
      # organization.
      class UpdateConversation < Rectify::Command
        # Public: Initializes the command.
        #
        # conversation - The Polis::Conversation that will be updated.
        # form - A form object with the params.
        def initialize(conversation, form)
          @conversation = conversation
          @form = form
        end

        # Executes the command. Broadcasts these events:
        #
        # - :ok when everything is valid.
        # - :invalid if the form wasn't valid and we couldn't proceed.
        #
        # Returns nothing.
        def call
          return broadcast(:invalid) if form.invalid?

          update_conversation
          broadcast(:invalid)
        end

        private

        attr_reader :form, :conversation

        def update_conversation
          Decidim.traceability.update!(
            conversation,
            form.current_user,
            polis_site_id: form.polis_site_id,
            polis_site_url: form.polis_site_url,
          )
        end

        def attributes
          {
            polis_site_id: form.polis_site_id,
            polis_site_url: form.polis_site_url
          }
        end
      end
    end
  end
end
