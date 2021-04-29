class CreateTypicalBeerFlavours < ActiveRecord::Migration[6.0]
  def change
    create_table :typical_beer_flavours do |t|
      t.references :flavour, null: false, foreign_key: true
      t.references :typical_beer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
