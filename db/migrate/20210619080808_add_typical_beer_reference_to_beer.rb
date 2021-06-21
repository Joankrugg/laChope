class AddTypicalBeerReferenceToBeer < ActiveRecord::Migration[6.0]
  def change
    add_reference :beers, :typical_beer, foreign_key: true
  end
end
