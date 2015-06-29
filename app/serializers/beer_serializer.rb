class BeerSerializer < ActiveModel::Serializer
  attributes :id,
             :brand,
             :style,
             :color,
             :alcohol,
             :bitterness,
             :size,
             :draft,
             :brewery
end
