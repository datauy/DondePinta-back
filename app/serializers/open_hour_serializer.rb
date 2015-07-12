class OpenHourSerializer < ActiveModel::Serializer
  attributes :start,
             :end,
             :next_day

  def start
    object.start.to_s(:time)
  end

  def end
    object.end.to_s(:time)
  end
end
