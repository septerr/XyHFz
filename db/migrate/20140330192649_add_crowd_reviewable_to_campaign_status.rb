class AddCrowdReviewableToCampaignStatus < ActiveRecord::Migration
  def change
    add_column :campaign_statuses, :crowd_reviewable, :boolean
  end
end
