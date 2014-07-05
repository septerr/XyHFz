class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.integer :user
      t.integer :campaign

      t.timestamps
    end
  end
end
