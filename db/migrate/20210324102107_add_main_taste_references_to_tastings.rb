class AddMainTasteReferencesToTastings < ActiveRecord::Migration[6.0]
  def change
    add_reference :tastings, :main_taste, foreign_key: true
  end
end
