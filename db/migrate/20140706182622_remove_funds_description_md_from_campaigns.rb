class RemoveFundsDescriptionMdFromCampaigns < ActiveRecord::Migration
  def up
    remove_column :campaigns, :funds_description_md
  end

  def down
    add_column :campaigns, :funds_description_md, :text
  end
end
