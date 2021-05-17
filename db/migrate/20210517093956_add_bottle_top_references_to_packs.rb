class AddBottleTopReferencesToPacks < ActiveRecord::Migration[6.0]
  def change
    add_reference :packs, :bottle_top, foreign_key: true
  end
end
