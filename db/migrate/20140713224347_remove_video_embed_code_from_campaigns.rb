class RemoveVideoEmbedCodeFromCampaigns < ActiveRecord::Migration
  def up
    remove_column :campaigns, :video_embed_code
  end

  def down
    add_column :campaigns, :video_embed_code, :string
  end
end
