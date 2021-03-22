class RemoveColumnBitternessFromTasting < ActiveRecord::Migration[6.0]
  def change
    remove_column :tastings, :bitterness, :integer
  end
end
