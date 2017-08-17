require 'oauth2'
module ApplicationHelper
  def self.get_client
    client = Foursquare2::Client.new(:client_id => ENV["foursq_client"], :client_secret => ENV["foursq_sec"],:api_version => '20170817')
  end
end
