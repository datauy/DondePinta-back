class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :brewery_type
      t.string :department
      t.string :city
      t.string :address
      t.string :phone
      t.string :email
      t.string :web
      t.boolean :serves_people
      t.string :foursquare_id
      t.decimal :lat
      t.decimal :lng

      t.timestamps null: false
    end
    add_index :breweries, :foursquare_id, unique: true
  end
end
