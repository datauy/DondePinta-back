module FoursquareVenue
  extend ActiveSupport::Concern

  included do
    has_many :open_hours, as: :venue, dependent: :destroy
  end

  def grouped_open_hours
    open_hours.order(:day).group_by(&:day)
  end
end
