class CreateTastingFlavours < ActiveRecord::Migration[6.0]
  def change
    create_table :tasting_flavours do |t|
      t.references :tasting, null: false, foreign_key: true
      t.references :flavour, null: false, foreign_key: true

      t.timestamps
    end
  end
end
