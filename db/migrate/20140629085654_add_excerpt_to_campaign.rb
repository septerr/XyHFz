class AddExcerptToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :excerpt, :string
  end
end
