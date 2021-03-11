class AddBeerReferenceToFancies < ActiveRecord::Migration[6.0]
  def change
    add_reference :fancies, :beer, foreign_key: true
  end
end
