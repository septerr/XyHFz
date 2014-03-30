class AddFundsDescriptionHtmlToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :funds_description_html, :text
  end
end
