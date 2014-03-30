class AddAmountToPledge < ActiveRecord::Migration
  def change
    add_column :pledges, :amount, :decimal, :precision => 12, :scale => 2
  end
end
