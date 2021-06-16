class AddPublicSearchReferenceToMainTaste < ActiveRecord::Migration[6.0]
  def change
    add_reference :public_searches, :main_taste, foreign_key: true
  end
end
