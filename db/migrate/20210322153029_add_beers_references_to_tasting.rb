class AddBeersReferencesToTasting < ActiveRecord::Migration[6.0]
  def change
    add_reference :tastings, :beer, foreign_key: true
  end
end
