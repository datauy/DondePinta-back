class OpenHour < ActiveRecord::Base
  validates :day, :start, :end, :venue, presence: true
  belongs_to :venue, polymorphic: true

  def description
    description = "#{start.to_s(:time)} - #{self.end.to_s(:time)}"
    description += " (+)" if next_day
    description
  end
end
