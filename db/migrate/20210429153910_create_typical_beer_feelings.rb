class CreateTypicalBeerFeelings < ActiveRecord::Migration[6.0]
  def change
    create_table :typical_beer_feelings do |t|
      t.references :typical_beer, null: false, foreign_key: true
      t.references :feeling, null: false, foreign_key: true

      t.timestamps
    end
  end
end
