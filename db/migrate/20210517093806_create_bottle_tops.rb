class CreateBottleTops < ActiveRecord::Migration[6.0]
  def change
    create_table :bottle_tops do |t|
      t.string :color

      t.timestamps
    end
  end
end
