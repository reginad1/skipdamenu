require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelperHelper. For example:
#
# describe ApplicationHelperHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
  describe "get_client Method" do
    it "Client key is in enviroment" do
      expect(ENV["foursq_client"]).to_not eq nil
    end
    it "Secret key is in enviroment" do
      expect(ENV["foursq_sec"]).to_not eq nil
    end
    it "client object return" do
      client = ApplicationHelper.get_client
      expect(client).to be_a(Foursquare2::Client)
    end

  end
  describe "menu_valid? method" do
    it "returns true" do
      expect(ApplicationHelper.menu_valid?(menu:{menus:{count:5}})).to be true
    end
    it "returns false" do
      expect(ApplicationHelper.menu_valid?(menu:{menus:{count:0}})).to be false
    end
  end

  describe "create_types method" do
    it "returns nil if name is nil" do
      restaurant = create(:restaurant)
      item = build(:item,name:nil, restaurant_id:restaurant.id)
      expect(ApplicationHelper.create_types(item)).to be nil
    end
    it "build types and saves object" do
      restaurant = create(:restaurant)
      item = build(:item,name:"Bagel Buns", restaurant_id:restaurant.id)
      ApplicationHelper.create_types(item)
      expect(item.id).to_not be nil
      expect(item.types).to_not be_empty
      expect(Type.find_by_name("bagel buns")).to_not be nil
      expect(Type.find_by_name("bagel")).to_not be nil
      expect(Type.find_by_name("buns")).to_not be nil
    end

  end

end

