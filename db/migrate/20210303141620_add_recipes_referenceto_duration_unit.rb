class AddRecipesReferencetoDurationUnit < ActiveRecord::Migration[6.0]
  def change
    add_reference :recipes, :duration_unit, foreign_key: true
  end
end
