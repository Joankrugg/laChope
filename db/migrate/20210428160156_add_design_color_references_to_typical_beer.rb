class AddDesignColorReferencesToTypicalBeer < ActiveRecord::Migration[6.0]
  def change
    add_reference :typical_beers, :design_color, foreign_key: true
  end
end
