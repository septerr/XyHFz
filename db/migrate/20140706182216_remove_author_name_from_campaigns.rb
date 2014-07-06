class RemoveAuthorNameFromCampaigns < ActiveRecord::Migration
  def up
    remove_column :campaigns, :author_name
  end

  def down
    add_column :campaigns, :author_name, :string
  end
end
