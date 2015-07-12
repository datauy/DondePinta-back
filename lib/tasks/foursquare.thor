require 'thor/rails'

class Foursquare < Thor
  include Thor::Rails

  desc 'all', 'import data for all venues and breweries from foursquare'
  def all
    invoke :venues
    invoke :breweries
  end

  desc 'venues', 'import data for all venues from foursquare'
  def venues
    Venue.all.each do |venue|
      update_model(venue)
    end
  end

  desc 'breweries', 'import data for all breweries from foursquare'
  def breweries
    Brewery.all.each do |brewery|
      update_model(brewery)
    end
  end

  private

  def update_model(model)
    if model.foursquare_id.present?
      begin
        data = FoursquareService.client.venue(model.foursquare_id)
        model.update!(
          department: data.location.state,
          city: data.location.city,
          address: data.location.address,
          phone: data.contact.formattedPhone,
          web: data.url,
          foursquare_url: data.canonicalUrl,
          lat: data.location.lat,
          lng: data.location.lng,
          open_hours: open_hours(data.id, model),
          photo_prefix: data.bestPhoto.try(:prefix),
          photo_suffix: data.bestPhoto.try(:suffix),
        )
        say_status :updated, "#{model.model_name.human} #{model.id} updated successfully", :green
      rescue => e
        say_status :error, "Couldn't update #{model.model_name.human} #{model.id}: #{e.message}", :red
      end
    else
      say_status :ignoring, "#{model.model_name.human} #{model.id} doesn't have foursquare_id", :yellow
    end
  end

  def open_hours(id, model)
    venue_hours(id).each_with_object([]) do |timeframe, hours|
      timeframe.days.product(timeframe.open).each do |day, open|
        hours <<  open_hour(day, open)
      end
    end
  end

  def venue_hours(id)
    FoursquareService.client.venue_hours(id).hours.timeframes || []
  end

  def open_hour(day, open)
    OpenHour.new(
      day: day % 7,
      start: time_for(open.start),
      end: time_for(open.end),
      next_day: open.end.starts_with?("+")
    )
  end

  def time_for(time)
    "#{time[-4..-3]}:#{time[-2..-1]}"
  end
end
