class AddTargetToBeers < ActiveRecord::Migration[6.0]
  def change
    add_column :beers, :target, :boolean, null: false, default: false
  end
end
