class AddAutumnCollectionToBeer < ActiveRecord::Migration[6.0]
  def change
    add_column :beers, :autumn_collection, :boolean, null: false, default: false
  end
end
