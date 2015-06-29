module FoursquareService
  extend self

  def client
    @@client ||= Foursquare2::Client.new(
      client_id: Rails.application.secrets.foursquare_client_id,
      client_secret: Rails.application.secrets.foursquare_client_secret,
      api_version: '20150628'
    )
  end
end
