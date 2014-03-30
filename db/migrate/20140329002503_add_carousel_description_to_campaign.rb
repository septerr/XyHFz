class AddCarouselDescriptionToCampaign < ActiveRecord::Migration
  def up
    add_column :campaigns, :carousel_description, :text
  end

  def down
    remove_column :campaigns, :carousel_description
  end
end
