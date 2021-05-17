class CreateBottles < ActiveRecord::Migration[6.0]
  def change
    create_table :bottles do |t|
      t.string :name
      t.integer :centiliter

      t.timestamps
    end
  end
end
