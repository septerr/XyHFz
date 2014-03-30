class AddVideoEmbedToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :video_embed_code, :text
  end
end
