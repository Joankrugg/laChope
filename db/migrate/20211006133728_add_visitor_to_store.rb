class AddVisitorToStore < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :visitor, :boolean, default: false
  end
end
