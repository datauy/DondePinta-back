class VenueSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :venue_type,
             :department,
             :city,
             :address,
             :phone,
             :email,
             :web,
             :foursquare_url,
             :lat,
             :lng,
             :photo_prefix,
             :photo_suffix

  has_many :open_hours
  has_many :beers, except: :brewery
end
