# frozen_string_literal: true

class CreateDecidimPolisConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_polis_conversations do |t|
      t.string :polis_site_id
      t.string :polis_site_url
      t.references :decidim_organization, index: true
      t.references :decidim_component, index: true

      t.timestamps
    end
  end
end
