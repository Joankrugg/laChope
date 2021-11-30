class AddMarketStyleReferenceToMarketPlace < ActiveRecord::Migration[6.0]
  def change
    add_reference :market_places, :market_style, foreign_key: true
  end
end
