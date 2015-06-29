class Beer < ActiveRecord::Base
  belongs_to :brewery
  validates :brewery, presence: true

  def description
    [brand, style].join(' - ')
  end
end
