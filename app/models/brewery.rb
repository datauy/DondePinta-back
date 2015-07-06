class Brewery < ActiveRecord::Base
  include FoursquareVenue

  has_many :beers

  def beer_descriptions
    beers.map(&:description).join(', ')
  end
end
