class AddBeerReferenceToCategories < ActiveRecord::Migration[6.0]
  def change
    add_reference :beers, :category, foreign_key: true
  end
end
