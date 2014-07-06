class RemoveDescriptionMdFromCampaigns < ActiveRecord::Migration
  def up
    remove_column :campaigns, :description_markdown
  end

  def down
    add_column :campaigns, :description_markdown, :text
  end
end
