class AddCampaignIdToResearchers < ActiveRecord::Migration
  def change
    add_column :researchers, :campaign_id, :integer
  end
end
