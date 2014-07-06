class CreateResearchers < ActiveRecord::Migration
  def change
    create_table :researchers do |t|
      t.string :name
      t.string :title
      t.string :institute
      t.text :bio

      t.timestamps
    end
  end
end
