class AddRecipesReferenceToUnit < ActiveRecord::Migration[6.0]
  def change
    add_reference :recipes, :unit, foreign_key: true
  end
end
