class CreateBeerFeelings < ActiveRecord::Migration[6.0]
  def change
    create_table :beer_feelings do |t|
      t.references :beer, null: false, foreign_key: true
      t.references :feeling, null: false, foreign_key: true

      t.timestamps
    end
  end
end
