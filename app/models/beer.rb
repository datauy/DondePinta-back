class Beer < ActiveRecord::Base
  belongs_to :brewery
  validates :brewery, :brand, :style, presence: true

  def description
    [brand, style].join(' - ')
  end
end
