class AddShowInCarouselToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :show_in_carousel, :boolean
  end
end
