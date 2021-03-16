class AddDesignReferenceToBalance < ActiveRecord::Migration[6.0]
  def change
    add_reference :designs, :balance, foreign_key: true
  end
end
