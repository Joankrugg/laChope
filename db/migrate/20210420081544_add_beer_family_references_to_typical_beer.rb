class AddBeerFamilyReferencesToTypicalBeer < ActiveRecord::Migration[6.0]
  def change
    add_reference :typical_beers, :beer_family, foreign_key: true
  end
end
