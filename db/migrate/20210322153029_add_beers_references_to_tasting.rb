class AddBeersReferencesToTasting < ActiveRecord::Migration[6.0]
  def change
    add_reference :beers, :tasting, foreign_key: true
  end
end
