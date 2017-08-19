module ApplicationHelper
  def self.get_client
    # OAuth2::Client.new(ENV["foursq_client"], ENV["foursq_sec"], :site => 'https://foursquare.com/oauth2/access_token')
    Foursquare2::Client.new(:client_id => ENV["foursq_client"], :client_secret => ENV["foursq_sec"],:api_version => '20170817')
  end

  def self.get_seed_venues
    client = self.get_client
    venues = client.search_venues(:ll=>"30.2672,-97.7431",query:"Restaurant")
    self.restaurant_creator(venues[:venues],[Restaurant.new])
  end

  def self.similar
    client = self.get_client
    venues = Restaurant.all
    venues.each do |venue|
      new_venues = client.venue_similar(venue.foursq_id)
      self.restaurant_creator(new_venues[:similarVenues][:items], venues)
    end
  end

  def self.restaurant_creator(venues, places)
    allRestaurant = places
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

  def self.create_types(object)
    return nil if object.name.nil?
    object.name.split(" ").each do |type|
      object.types << Type.find_or_create_by(name: type.downcase)
    end
    object.types << Type.find_or_create_by(name: object.name.downcase)
    object.save
  end

  def self.create_menu(menu_item,restaurant)
    item = Item.new(name: menu_item.name, price: menu_item.price,restaurant_id:restaurant.id,entry_id:menu_item.entryId,description:menu_item.description)
    self.create_types(item)
  end

  def self.update_menus(menu_item,restaurant)
    item = Item.find_or_create_by({entry_id:menu_item.entryId})
    item.update_attributes(name: menu_item.name, price: menu_item.price,restaurant_id:restaurant.id,entry_id:menu_item.entryId,description:menu_item.description)
    self.create_types(item)
  end

  def self.traverse_menu(choice="nil")
    return nil if !((choice == "create") || (choice ==  "update"))
    restaurants = Restaurant.all
    client = self.get_client
    restaurants.each do |restaurant|
      menu = client.venue_menus(restaurant.foursq_id)
      next if !self.menu_valid?(menu)
      menu[:menu][:menus][:items].each do |item|
        item[:entries][:items].each do |categories|
          categories[:entries][:items].each do |menu_item|
            self.create_menu(menu_item,restaurant) if choice == "create"
            self.update_menus(menu_item,restaurant) if choice == "update"
          end
        end
      end
    end
    true
  end

  def self.menu_valid?(menu)
    return false if menu[:menu][:menus][:count] == 0
    true
  end

end


# client = ApplicationHelper.get_client
# used in all the other methods, use this if you want to make specific database calls to foursquare
# read foursquare2 gem for more information.

# ApplicationHelper.get_seed_venues
# seed db with 30 restaurants from rails console!!

# ApplicationHelper.similar
# use this if you want to generate more restaurants (5 per restaurant in db)

# ApplicationHelper.traverse_menu("create")
# this will create menues for each of the restaurants in the db

# ApplicationHelper.traverse_menu("update")
# this will update menus if db has been around and we want most recent data


