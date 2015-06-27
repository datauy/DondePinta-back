class Venue < ActiveRecord::Base
  has_and_belongs_to_many :beers

  def foursquare_link
    "https://foursquare.com/v/#{foursquare_id}" if foursquare_id.present?
  end
end
