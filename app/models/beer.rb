class Beer < ActiveRecord::Base
  belongs_to :brewery
  belongs_to :style
  validates :brewery, :brand, :style, presence: true

  def description
    [brand, style.name].join(' - ')
  end
end
