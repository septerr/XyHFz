class AddUpvoteCountToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :upvote_count, :integer
  end
end
