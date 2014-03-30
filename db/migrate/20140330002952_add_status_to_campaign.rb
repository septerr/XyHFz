class AddStatusToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :status, :integer
  end
end
