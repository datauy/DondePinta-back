class AddBreweryToBeer < ActiveRecord::Migration
  def change
    add_reference :beers, :brewery, index: true, foreign_key: true, null: false

    drop_join_table :breweries, :beers do |t|
      t.index [:brewery_id, :beer_id]
    end
  end
end
