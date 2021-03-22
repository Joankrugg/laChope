class AddArticleReferencesToTheme < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :theme, foreign_key: true
  end
end
