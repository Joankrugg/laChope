class AddDesignReferenceToCategory < ActiveRecord::Migration[6.0]
  def change
    add_reference :designs, :category, foreign_key: true
  end
end
