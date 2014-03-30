class AddAttachmentAuthorPhotoToCampaigns < ActiveRecord::Migration
  def self.up
    change_table :campaigns do |t|
      t.attachment :author_photo
    end
  end

  def self.down
    drop_attached_file :campaigns, :author_photo
  end
end
