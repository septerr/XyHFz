class AddAuthorNameToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :author_name, :string
  end
end
