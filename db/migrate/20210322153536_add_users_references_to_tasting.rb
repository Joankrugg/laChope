class AddUsersReferencesToTasting < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :tasting, foreign_key: true
  end
end
