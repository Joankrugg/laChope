class AddTastingPlaceReferencesToMarketPlace < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasting_places, :market_place, foreign_key: true
  end
end
