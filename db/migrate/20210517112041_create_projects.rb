class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.references :pack, null: false, foreign_key: true
      t.references :typical_beer, null: false, foreign_key: true
      t.references :sticker, null: false, foreign_key: true
      t.references :bottle_top, null: false, foreign_key: true
      t.integer :batch

      t.timestamps
    end
  end
end
