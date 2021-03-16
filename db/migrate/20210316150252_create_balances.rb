class CreateBalances < ActiveRecord::Migration[6.0]
  def change
    create_table :balances do |t|
      t.string :name

      t.timestamps
    end
  end
end
