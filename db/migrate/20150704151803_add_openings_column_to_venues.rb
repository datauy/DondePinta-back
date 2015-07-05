class AddOpeningsColumnToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :openings, :string, array: true, default: '{}'
  end
end
