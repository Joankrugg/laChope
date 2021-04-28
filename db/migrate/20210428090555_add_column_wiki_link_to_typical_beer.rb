class AddColumnWikiLinkToTypicalBeer < ActiveRecord::Migration[6.0]
  def change
    add_column :typical_beers, :wiki_link, :string
  end
end
