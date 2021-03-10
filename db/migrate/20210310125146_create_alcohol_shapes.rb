class CreateAlcoholShapes < ActiveRecord::Migration[6.0]
  def change
    create_table :alcohol_shapes do |t|
      t.string :name

      t.timestamps
    end
  end
end
