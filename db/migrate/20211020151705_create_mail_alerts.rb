class CreateMailAlerts < ActiveRecord::Migration[6.0]
  def change
    create_table :mail_alerts do |t|
      t.boolean :mail_notification
      t.references :personal_message, null: false, foreign_key: true
      t.timestamps
    end
  end
end
