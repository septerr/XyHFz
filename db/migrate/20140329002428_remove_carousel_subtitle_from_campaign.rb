class RemoveCarouselSubtitleFromCampaign < ActiveRecord::Migration
  def up
    remove_column :campaigns, :carousel_subtitle
  end

  def down
    add_column :campaigns, :carousel_subtitle, :text
  end
end
