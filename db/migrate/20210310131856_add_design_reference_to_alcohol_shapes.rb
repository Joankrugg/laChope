class AddDesignReferenceToAlcoholShapes < ActiveRecord::Migration[6.0]
  def change
    add_reference :designs, :alcohol_shape, foreign_key: true
  end
end
