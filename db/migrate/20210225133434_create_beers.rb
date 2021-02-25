class CreateBeers < ActiveRecord::Migration[6.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :style
      t.float :alcohol_level
      t.integer :color
      t.integer :bitterness
      t.text :description
      t.string :photo
      t.integer :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
