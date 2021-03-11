class CreateFancies < ActiveRecord::Migration[6.0]
  def change
    create_table :fancies do |t|
      t.boolean :heart

      t.timestamps
    end
  end
end
