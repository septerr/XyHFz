class RemoveCarouselTitleFromCampaign < ActiveRecord::Migration
  def up
    remove_column :campaigns, :carousel_title
  end

  def down
    add_column :campaigns, :carousel_title, :string
  end
end
