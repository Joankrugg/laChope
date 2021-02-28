class AddTemperatureToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :temperature, :integer
  end
end
