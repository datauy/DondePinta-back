class BeerSerializer < ActiveModel::Serializer
  attributes :id,
             :brand,
             :style,
             :color,
             :alcohol,
             :bitterness,
             :size,
             :draft

  has_one :brewery, except: :beers
end
