class CreateTastingFeelings < ActiveRecord::Migration[6.0]
  def change
    create_table :tasting_feelings do |t|
      t.references :tasting, null: false, foreign_key: true
      t.references :feeling, null: false, foreign_key: true

      t.timestamps
    end
  end
end
