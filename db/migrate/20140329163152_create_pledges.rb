class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :campaign_id

      t.timestamps
    end
  end
end
