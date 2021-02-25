class AddBeerReferenceToStyles < ActiveRecord::Migration[6.0]
  def change
    add_reference :beers, :style, foreign_key: true
  end
end
