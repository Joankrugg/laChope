class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.integer :step
      t.integer :duration
      t.integer :quantity
      t.references :beer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
