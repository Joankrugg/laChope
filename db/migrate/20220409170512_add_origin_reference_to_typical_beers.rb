class AddOriginReferenceToTypicalBeers < ActiveRecord::Migration[6.0]
  def change
    add_reference :typical_beers, :origin, foreign_key: true
  end
end
