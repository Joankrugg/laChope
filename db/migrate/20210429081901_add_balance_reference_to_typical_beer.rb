class AddBalanceReferenceToTypicalBeer < ActiveRecord::Migration[6.0]
  def change
    add_reference :typical_beers, :balance, foreign_key: true
  end
end
