class AddBalanceReferenceToBeer < ActiveRecord::Migration[6.0]
  def change
    add_reference :beers, :balance, foreign_key: true
  end
end
