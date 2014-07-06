class RemoveCarouselDescriptionFromCampaigns < ActiveRecord::Migration
  def up
    remove_column :campaigns, :carousel_description
  end

  def down
    add_column :campaigns, :carousel_description, :text
  end
end
