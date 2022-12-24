class CreateMarketPlaceBeers < ActiveRecord::Migration[6.0]
  def change
    create_table :market_place_beers do |t|
      t.references :market_place, null: false, foreign_key: true
      t.references :beer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
