class AddPhotoToVenuesAndBreweries < ActiveRecord::Migration
  def change
    add_column :venues, :photo_prefix, :string
    add_column :venues, :photo_suffix, :string

    add_column :breweries, :photo_prefix, :string
    add_column :breweries, :photo_suffix, :string
  end
end
