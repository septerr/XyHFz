class RemoveImageFromCampaign < ActiveRecord::Migration
  def up
    drop_attached_file :campaigns, :image
  end

  def down
    change_table :campaigns do |t|
      t.attachment :image
    end
  end
end
