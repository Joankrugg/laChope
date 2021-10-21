class AddMarketPlaceReferenceToStore < ActiveRecord::Migration[6.0]
  def change
    add_reference :stores, :market_place, foreign_key: true
  end
end
