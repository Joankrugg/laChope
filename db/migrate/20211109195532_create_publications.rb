class CreatePublications < ActiveRecord::Migration[6.0]
  def change
    create_table :publications do |t|
      t.string :content
      t.string :link
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
