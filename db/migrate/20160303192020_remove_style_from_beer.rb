class RemoveStyleFromBeer < ActiveRecord::Migration
  def change
    remove_column :beers, :style
  end
end
