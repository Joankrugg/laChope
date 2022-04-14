class CreateTastingPlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :tasting_places do |t|
      t.boolean :active
      t.timestamps
    end
  end
end
