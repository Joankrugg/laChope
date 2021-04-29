class AddAlcoholShapeReferenceToTypicalBeer < ActiveRecord::Migration[6.0]
  def change
    add_reference :typical_beers, :alcohol_shape, foreign_key: true
  end
end
