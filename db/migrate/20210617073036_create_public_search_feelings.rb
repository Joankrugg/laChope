class CreatePublicSearchFeelings < ActiveRecord::Migration[6.0]
  def change
    create_table :public_search_feelings do |t|
      t.references :feeling, null: false, foreign_key: true
      t.references :public_search, null: false, foreign_key: true

      t.timestamps
    end
  end
end
