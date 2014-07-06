class DropAttachmentCarouselImage < ActiveRecord::Migration
  def self.up
    drop_attached_file :campaigns, :carousel_image
  end

  def self.down
    change_table :campaigns do |t|
      t.attachment :carousel_image
    end
  end
end
