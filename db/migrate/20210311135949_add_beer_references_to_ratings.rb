class AddBeerReferencesToRatings < ActiveRecord::Migration[6.0]
  def change
    add_reference :ratings, :beer, foreign_key: true
  end
end
