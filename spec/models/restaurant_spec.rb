require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  before(:all) do
    Restaurant.delete_all
  end

  describe "Attributes" do
    it "has a name" do
      name = "Franklin's"
      restaurant = build(:restaurant,name:name)
      expect(restaurant.name).to eq name
    end
    it "has a google_id" do
      google_id = "1234567890qwertyuiop"
      restaurant = build(:restaurant,google_id:google_id )
      expect(restaurant.google_id).to eq google_id
    end
    it "has a foursq_id" do
      foursq_id = "1234567890qwertyuiop"
      restaurant = build(:restaurant,foursq_id:foursq_id )
      expect(restaurant.foursq_id).to eq foursq_id
    end
    it "has longitude" do
      longitude = "32.12312313131"
      restaurant = build(:restaurant,longitude:longitude )
      expect(restaurant.longitude).to eq longitude
    end
    it "has latitude" do
      latitude = "32.12312313131"
      restaurant = build(:restaurant,latitude:latitude )
      expect(restaurant.latitude).to eq latitude
    end
  end

  describe "Associations" do
    it "has many items" do
      restaurant = create(:restaurant)
      expect(restaurant.items).to_not be_empty
    end
  end

  describe "Can create in database" do
    it "Save in to the database"  do
      expect{create(:restaurant)}.to change{Restaurant.count}.by(1)
    end
    it "can't save if foursq_id matches" do
      foursq_id = "1234567890qwertyuiop"
      create(:restaurant,foursq_id:foursq_id)
      duplicate = Restaurant.create(attributes_for(:restaurant,foursq_id:foursq_id))
      expect(duplicate.errors.messages).to_not be_empty
    end
  end
end
