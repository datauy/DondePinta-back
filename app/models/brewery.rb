class Brewery < ActiveRecord::Base
  has_many :beers

  def beer_descriptions
    beers.map(&:description).join(', ')
  end
end
