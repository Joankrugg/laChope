class AddUserReferencesToSexe < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :sexe, foreign_key: true
  end
end
