class AddAuthorDescriptionHtmlToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :author_description_html, :text
  end
end
