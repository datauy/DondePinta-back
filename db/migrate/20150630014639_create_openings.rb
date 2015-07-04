class CreateOpenings < ActiveRecord::Migration
  def change
    create_table :openings do |t|
      t.integer :day
      t.time :open
      t.time :close
      t.references :venue, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
