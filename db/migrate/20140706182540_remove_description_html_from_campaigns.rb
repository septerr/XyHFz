class RemoveDescriptionHtmlFromCampaigns < ActiveRecord::Migration
  def up
    remove_column :campaigns, :description_html
  end

  def down
    add_column :campaigns, :description_html, :text
  end
end
