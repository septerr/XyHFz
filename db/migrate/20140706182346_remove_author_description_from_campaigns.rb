class RemoveAuthorDescriptionFromCampaigns < ActiveRecord::Migration
  def up
    remove_column :campaigns, :author_description_md
  end

  def down
    add_column :campaigns, :author_description_md, :text
  end
end
