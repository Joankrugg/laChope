class CreatePublicSearchFlavours < ActiveRecord::Migration[6.0]
  def change
    create_table :public_search_flavours do |t|
      t.references :flavour, null: false, foreign_key: true
      t.references :public_search, null: false, foreign_key: true

      t.timestamps
    end
  end
end
