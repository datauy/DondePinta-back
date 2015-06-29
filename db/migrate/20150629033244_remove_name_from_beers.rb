class RemoveNameFromBeers < ActiveRecord::Migration
  def change
    remove_column :beers, :name, :string
  end
end
