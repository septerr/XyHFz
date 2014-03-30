class AddBackerCountToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :backer_count, :integer
  end
end
