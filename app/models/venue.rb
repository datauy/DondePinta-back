class Venue < ActiveRecord::Base
  include FoursquareVenue

  has_and_belongs_to_many :beers
end
