class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :brand
      t.string :style
      t.string :color
      t.string :alcohol
      t.string :bitterness
      t.string :size
      t.boolean :draft

      t.timestamps null: false
    end
  end
end
