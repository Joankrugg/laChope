class CreateStoreBeers < ActiveRecord::Migration[6.0]
  def change
    create_table :store_beers do |t|
      t.references :beer, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
