class CreateDurationUnits < ActiveRecord::Migration[6.0]
  def change
    create_table :duration_units do |t|
      t.string :name

      t.timestamps
    end
  end
end
