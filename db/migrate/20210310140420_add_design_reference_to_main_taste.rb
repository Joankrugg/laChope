class AddDesignReferenceToMainTaste < ActiveRecord::Migration[6.0]
  def change
    add_reference :designs, :main_taste, foreign_key: true
  end
end
