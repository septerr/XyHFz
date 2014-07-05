class AddSummaryToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :summary, :string
  end
end
