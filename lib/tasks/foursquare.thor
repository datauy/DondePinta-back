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

  def parse_time(time)
    if (time.length == 5)
      hour = time[1,2]
      mins = time[3,2]
    else
      hour = time[0,2]
      mins = time[2,2]
    end
    return Time.parse(hour.concat(":").concat(mins))
  end

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
          lng: data.location.lng
        )
        say_status :updated, "#{model.model_name.human} #{model.id} updated successfully", :green
      rescue => e
        say_status :error, "Couldn't update #{model.model_name.human} #{model.id}: #{e.message}", :red
      end
    else
      say_status :ignoring, "#{model.model_name.human} #{model.id} doesn't have foursquare_id", :yellow
    end
  end
end
