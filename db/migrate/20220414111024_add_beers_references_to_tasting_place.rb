class AddBeersReferencesToTastingPlace < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasting_places, :beer, foreign_key: true
  end
end
