class CreateDraftsetBeers < ActiveRecord::Migration[6.0]
  def change
    create_table :draftset_beers do |t|
      t.references :draftset, null: false, foreign_key: true
      t.references :beer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
