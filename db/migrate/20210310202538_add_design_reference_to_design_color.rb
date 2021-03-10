class AddDesignReferenceToDesignColor < ActiveRecord::Migration[6.0]
  def change
    add_reference :designs, :design_color, foreign_key: true
  end
end
