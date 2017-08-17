class ApplicationController < ActionController::Base
  require 'lib/foursquare'
  include Foursquare
  protect_from_forgery with: :exception
end
