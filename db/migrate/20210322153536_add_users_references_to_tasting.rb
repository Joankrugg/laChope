class AddUsersReferencesToTasting < ActiveRecord::Migration[6.0]
  def change
    add_reference :tastings, :user, foreign_key: true
  end
end
