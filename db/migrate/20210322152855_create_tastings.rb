class CreateTastings < ActiveRecord::Migration[6.0]
  def change
    create_table :tastings do |t|
      t.datetime :date
      t.integer :bitterness
      t.integer :global_rating

      t.timestamps
    end
  end
end
