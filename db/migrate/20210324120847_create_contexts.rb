class CreateContexts < ActiveRecord::Migration[6.0]
  def change
    create_table :contexts do |t|
      t.string :name

      t.timestamps
    end
  end
end
