class AddCarouselSubtitleToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :carousel_subtitle, :string
  end
end
