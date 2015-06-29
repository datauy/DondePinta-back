class RemoveFoursquareIdIndexFromBreweries < ActiveRecord::Migration
  def up
    remove_index :breweries, :foursquare_id
  end

  def down
    add_index :breweries, :foursquare_id, unique: true
  end
end
