class AddMainTasteReferenceToTypicalBeer < ActiveRecord::Migration[6.0]
  def change
    add_reference :typical_beers, :main_taste, foreign_key: true
  end
end
