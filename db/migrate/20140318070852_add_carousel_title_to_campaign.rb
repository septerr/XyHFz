class AddCarouselTitleToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :carousel_title, :string
  end
end
