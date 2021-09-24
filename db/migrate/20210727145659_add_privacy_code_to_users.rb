class AddPrivacyCodeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :privacy_code, :string
  end
end
