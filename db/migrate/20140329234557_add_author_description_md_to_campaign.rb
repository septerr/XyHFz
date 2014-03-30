class AddAuthorDescriptionMdToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :author_description_md, :text
  end
end
