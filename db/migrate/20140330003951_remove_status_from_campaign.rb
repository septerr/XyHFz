class RemoveStatusFromCampaign < ActiveRecord::Migration
  def up
    remove_column :campaigns, :status
  end

  def down
    add_column :campaigns, :status, :integer
  end
end
