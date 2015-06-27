class CreateVenueBeerJoinTable < ActiveRecord::Migration
  def change
    create_join_table :venues, :beers do |t|
      t.index [:venue_id, :beer_id]
      # t.index [:beer_id, :venue_id]
    end
  end
end
