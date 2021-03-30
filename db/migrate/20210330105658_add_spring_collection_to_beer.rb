class AddSpringCollectionToBeer < ActiveRecord::Migration[6.0]
  def change
    add_column :beers, :spring_collection, :boolean, null: false, default: false
  end
end
