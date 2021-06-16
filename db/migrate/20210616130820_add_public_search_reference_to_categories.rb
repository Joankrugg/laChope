class AddPublicSearchReferenceToCategories < ActiveRecord::Migration[6.0]
  def change
    add_reference :public_searches, :category, foreign_key: true
  end
end
