class RemoveAuthorDescriptionhtmlFromCampaigns < ActiveRecord::Migration
  def up
    remove_column :campaigns, :author_description_html
  end

  def down
    add_column :campaigns, :author_description_html, :text
  end
end
