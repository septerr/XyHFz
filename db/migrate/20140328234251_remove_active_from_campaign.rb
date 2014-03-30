class RemoveActiveFromCampaign < ActiveRecord::Migration
  def up
    remove_column :campaigns, :active
  end

  def down
    add_column :campaigns, :active, :boolean
  end
end
