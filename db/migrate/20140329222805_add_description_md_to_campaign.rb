class AddDescriptionMdToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :description_markdown, :text
  end
end
