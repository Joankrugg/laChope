class CreateDesignFlavours < ActiveRecord::Migration[6.0]
  def change
    create_table :design_flavours do |t|
      t.references :design, null: false, foreign_key: true
      t.references :flavour, null: false, foreign_key: true

      t.timestamps
    end
  end
end
