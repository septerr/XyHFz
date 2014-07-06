class RemoveFundsDescriptionHtmlFromCampaigns < ActiveRecord::Migration
  def up
    remove_column :campaigns, :funds_description_html
  end

  def down
    add_column :campaigns, :funds_description_html, :text
  end
end
