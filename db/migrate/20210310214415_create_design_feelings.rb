class CreateDesignFeelings < ActiveRecord::Migration[6.0]
  def change
    create_table :design_feelings do |t|
      t.references :design, null: false, foreign_key: true
      t.references :feeling, null: false, foreign_key: true

      t.timestamps
    end
  end
end
