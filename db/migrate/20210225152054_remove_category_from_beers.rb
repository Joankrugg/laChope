class RemoveCategoryFromBeers < ActiveRecord::Migration[6.0]
  def change
    remove_column :beers, :category, :integer
  end
end
