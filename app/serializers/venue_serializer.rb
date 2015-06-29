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
             :beers
end
