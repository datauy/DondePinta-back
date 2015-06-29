class AddFoursquareUrlToVenuesAndBreweries < ActiveRecord::Migration
  def change
    add_column :breweries, :foursquare_url, :string
    add_column :venues, :foursquare_url, :string
  end
end
