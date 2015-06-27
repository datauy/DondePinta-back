class CreateBreweryBeerJoinTable < ActiveRecord::Migration
  def change
    create_join_table :breweries, :beers do |t|
      t.index [:brewery_id, :beer_id]
      # t.index [:beer_id, :brewery_id]
    end
  end
end
