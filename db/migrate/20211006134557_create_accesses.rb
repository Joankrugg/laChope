class CreateAccesses < ActiveRecord::Migration[6.0]
  def change
    create_table :accesses do |t|
      t.string :code
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
