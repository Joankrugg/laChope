class AddTastingReferencesToBalance < ActiveRecord::Migration[6.0]
  def change
    add_reference :tastings, :balance, foreign_key: true
  end
end
