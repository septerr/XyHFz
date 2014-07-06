class AddFeaturedImageToCampaign < ActiveRecord::Migration
  def self.up
    change_table :campaigns do |t|
      t.attachment :featured_image
    end

  end

  def self.down
    drop_attached_file :campaigns, :featured_image
  end
end
