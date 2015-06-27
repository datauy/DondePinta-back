class BeerSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :brand,
             :style,
             :color,
             :alcohol,
             :bitterness,
             :size,
             :draft
end
