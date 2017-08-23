require 'rails_helper'

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

  describe "get_seed_venues method" do
    it "create Restaurant" do
      expect{ApplicationHelper.get_seed_venues}.to change{Restaurant.count}
    end
  end
  describe "similar method" do
    it "create Restaurant" do
      client = ApplicationHelper.get_client
      venue = client.search_venues(:ll=>"30.2672,-97.7431",query:"Restaurant",limit:1)
      ApplicationHelper.restaurant_creator(venue[:venues],[Restaurant.new])
      expect{ApplicationHelper.similar}.to change{Restaurant.count}
    end
  end

  describe "restaurant_creator method" do
    it "create Restaurant" do
      client = ApplicationHelper.get_client
      venue = client.search_venues(:ll=>"30.2672,-97.7431",query:"Restaurant",limit:1)
      expect{ApplicationHelper.restaurant_creator(venue[:venues],[Restaurant.new])}.to change{Restaurant.count}
    end
  end
  describe "traverse_menu method" do
    it "will return nil if choice is not 'update' or 'create'" do
      expect(ApplicationHelper.traverse_menu()).to be nil
      expect(ApplicationHelper.traverse_menu("break")).to be nil
      expect(ApplicationHelper.traverse_menu("/n/n")).to be nil
      expect(ApplicationHelper.traverse_menu("\n\n")).to be nil
      expect(ApplicationHelper.traverse_menu("updat")).to be nil
      expect(ApplicationHelper.traverse_menu("creat")).to be nil
      expect(ApplicationHelper.traverse_menu("create")).to_not be nil
      expect(ApplicationHelper.traverse_menu("update")).to_not be nil
    end
    it "will create menus" do
      client = ApplicationHelper.get_client
      venue = client.search_venues(:ll=>"30.2672,-97.7431",query:"Restaurant",limit:1)
      ApplicationHelper.restaurant_creator(venue[:venues],[Restaurant.new])
      current_count = Item.count
      value = ApplicationHelper.traverse_menu("create")
      expect(current_count).to_not eq Item.count
      expect(value).to eq true
    end
    it "will update menus" do
      client = ApplicationHelper.get_client
      venue = client.search_venues(:ll=>"30.2672,-97.7431",query:"Restaurant",limit:1)
      ApplicationHelper.restaurant_creator(venue[:venues],[Restaurant.new])
      ApplicationHelper.traverse_menu("create")
      current_count = Item.count

      value = ApplicationHelper.traverse_menu("update")
      expect(current_count).to eq Item.count
      expect(value).to eq true
    end
  end
end

