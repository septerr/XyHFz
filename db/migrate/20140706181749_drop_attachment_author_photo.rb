class DropAttachmentAuthorPhoto < ActiveRecord::Migration
  def self.up
    drop_attached_file :campaigns, :author_photo
  end

  def self.down
    change_table :campaigns do |t|
      t.attachment :author_photo
    end
  end
end
