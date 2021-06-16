class AddPublicsearchReferencesToBalances < ActiveRecord::Migration[6.0]
  def change
    add_reference :public_searches, :balance, foreign_key: true
  end
end
