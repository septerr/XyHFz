class RemoveShowInCarouselFromCampaigns < ActiveRecord::Migration
  def up
    remove_column :campaigns, :show_in_carousel
  end

  def down
    add_column :campaigns, :show_in_carousel, :boolean
  end
end
