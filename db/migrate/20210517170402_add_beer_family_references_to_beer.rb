class AddBeerFamilyReferencesToBeer < ActiveRecord::Migration[6.0]
  def change
    add_reference :beers, :beer_family, foreign_key: true
  end
end
