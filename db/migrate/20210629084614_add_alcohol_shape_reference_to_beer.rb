class AddAlcoholShapeReferenceToBeer < ActiveRecord::Migration[6.0]
  def change
    add_reference :beers, :alcohol_shape, foreign_key: true
  end
end
