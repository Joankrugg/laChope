class AddColumnPageLinkToBeers < ActiveRecord::Migration[6.0]
  def change
    add_column :beers, :page_link, :string
  end
end
