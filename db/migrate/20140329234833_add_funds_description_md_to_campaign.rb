class AddFundsDescriptionMdToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :funds_description_md, :text
  end
end
