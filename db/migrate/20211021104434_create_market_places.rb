class CreateMarketPlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :market_places do |t|
      t.string :name
      t.string :zipcode
      t.string :city
      t.string :website

      t.timestamps
    end
  end
end
