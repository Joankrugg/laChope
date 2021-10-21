class AddCoordinatesToMarketPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :market_places, :latitude, :float
    add_column :market_places, :longitude, :float
  end
end
