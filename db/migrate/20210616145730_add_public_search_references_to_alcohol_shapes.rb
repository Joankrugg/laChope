class AddPublicSearchReferencesToAlcoholShapes < ActiveRecord::Migration[6.0]
  def change
    add_reference :public_searches, :alcohol_shape, foreign_key: true
  end
end
