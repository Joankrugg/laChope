class CreatePublicSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :public_searches do |t|

      t.timestamps
    end
  end
end
