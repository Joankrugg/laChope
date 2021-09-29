class AddReadToPersonalMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :personal_messages, :read, :boolean, default: false
  end
end
