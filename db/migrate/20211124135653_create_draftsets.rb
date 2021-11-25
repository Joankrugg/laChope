class CreateDraftsets < ActiveRecord::Migration[6.0]
  def change
    create_table :draftsets do |t|
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
