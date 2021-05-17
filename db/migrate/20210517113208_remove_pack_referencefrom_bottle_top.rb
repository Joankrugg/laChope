class RemovePackReferencefromBottleTop < ActiveRecord::Migration[6.0]
  def change
    remove_reference :packs, :bottle_top, index: true, foreign_key: true
  end
end
