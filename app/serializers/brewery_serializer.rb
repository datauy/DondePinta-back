class BrewerySerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :brewery_type,
             :department,
             :city,
             :address,
             :phone,
             :email,
             :web,
             :serves_people,
             :foursquare_url,
             :lat,
             :lng,
             :beers
end
