class CreateBeerFamilies < ActiveRecord::Migration[6.0]
  def change
    create_table :beer_families do |t|
      t.string :name

      t.timestamps
    end
  end
end
