class CreateOpenHours < ActiveRecord::Migration
  def change
    create_table :open_hours do |t|
      t.integer :day, null: false
      t.time :start, null: false
      t.time :end, null: false
      t.boolean :next_day, null: false, default: false
      t.references :venue, polymorphic: true, index: true, null: false
    end
  end
end
