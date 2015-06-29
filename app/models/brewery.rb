class Brewery < ActiveRecord::Base
  has_many :beers

  def foursquare_url
    "https://foursquare.com/v/#{foursquare_id}" if foursquare_id.present?
  end

  def beer_descriptions
    beers.map(&:description).join(', ')
  end
end
