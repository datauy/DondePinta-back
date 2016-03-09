class Beer < ActiveRecord::Base
  belongs_to :brewery
  belongs_to :style
  validates :brewery, :brand, :style, presence: true

  def description
    #TODO - add style once the data is fixed
    brand
  end
end
