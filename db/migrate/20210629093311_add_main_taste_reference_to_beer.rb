class AddMainTasteReferenceToBeer < ActiveRecord::Migration[6.0]
  def change
    add_reference :beers, :main_taste, foreign_key: true
  end
end
