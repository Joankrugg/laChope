class RemoveStyleFromBeers < ActiveRecord::Migration[6.0]
  def change
    remove_column :beers, :style, :integer
  end
end
