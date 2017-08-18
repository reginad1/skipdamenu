require 'oauth2'
module ApplicationHelper
  def self.get_client
    client = Foursquare2::Client.new(:client_id => ENV["foursq_client"], :client_secret => ENV["foursq_sec"],:api_version => '20170817')
  end
  def self.get_seed_venues
    client = self.get_client
    venues = client.search_venues(:ll=>"30.2672,-97.7431",query:"food")
    self.restaurant_creator(venues[:venues])
  end

  def self.similar
    client = self.get_client
    venues = Restaurant.all
    venues.each do |venue|
      new_venues = client.venue_similar(venue.foursq_id)
      self.restaurant_creator(new_venues[:similarVenues][:items])
    end
  end

  def self.restaurant_creator(venues)
    allRestaurant = Restaurant.all
    venues.each do |venue|
      already_have = allRestaurant.any? do |place|
        place.foursq_id == venue[:id]
     end
      if (!already_have)
      new_Place = Restaurant.new({foursq_id:venue[:id],name:venue[:name],latitude:venue[:location][:lat],longitude:venue[:location][:lng]})
      new_Place.save
      end
    end
  end
end
