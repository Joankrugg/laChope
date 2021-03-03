class AddRecipesReferencesToProductType < ActiveRecord::Migration[6.0]
  def change
    add_reference :recipes, :product_type, foreign_key: true
  end
end
