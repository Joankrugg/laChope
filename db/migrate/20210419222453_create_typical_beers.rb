class CreateTypicalBeers < ActiveRecord::Migration[6.0]
  def change
    create_table :typical_beers do |t|
      t.string :name
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.references :style, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
