class AddGoalToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :goal, :decimal, precision: 12, scale: 2
  end
end
