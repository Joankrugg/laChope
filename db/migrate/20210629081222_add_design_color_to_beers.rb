class AddDesignColorToBeers < ActiveRecord::Migration[6.0]
  def change
    add_reference :beers, :design_color, foreign_key: true
  end
end
