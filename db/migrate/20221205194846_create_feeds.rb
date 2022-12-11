class CreateFeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :feeds do |t|
      t.string :photo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
