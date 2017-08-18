module Foursquare
  def get_client
    client = Foursquare2::Client.new(:client_id => ENV["foursq_client"], :client_secret => ENV["foursq_sec"])
  end
end
