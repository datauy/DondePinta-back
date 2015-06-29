class AddNullContraintToBeerBrandAndStyle < ActiveRecord::Migration
  def up
    change_column :beers, :brand, :string, null: false
    change_column :beers, :style, :string, null: false
  end

  def down
    change_column :beers, :brand, :string, null: true
    change_column :beers, :style, :string, null: true
  end
end
