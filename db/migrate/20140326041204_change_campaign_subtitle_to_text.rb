class ChangeCampaignSubtitleToText < ActiveRecord::Migration
  def up
    change_table :campaigns do |t|
      t.change :carousel_subtitle, :text
    end
  end

  def down
    change_table :campaigns do |t|
      t.change :carousel_subtitle, :string
    end
  end
end
