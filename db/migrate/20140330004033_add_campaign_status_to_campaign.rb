class AddCampaignStatusToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :campaign_status_id, :integer
  end
end
