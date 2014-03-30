class AddDescriptionHtmlToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :description_html, :text
  end
end
