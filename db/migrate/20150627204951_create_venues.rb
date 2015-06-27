class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :venue_type
      t.string :department
      t.string :city
      t.string :address
      t.string :phone
      t.string :email
      t.string :web
      t.string :foursquare_id
      t.decimal :lat
      t.decimal :lng

      t.timestamps null: false
    end
  end
end
