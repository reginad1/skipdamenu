require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "Attributes" do
    it "has a name" do
      name = "Preztel"
      item = build(:item,name:name)
      expect(item.name).to eq name
    end
    it "has a price" do
      price = "$5.00"
      item = build(:item,price:price)
      expect(item.price).to eq price
    end
    it "has a description" do
      description = "The Best you will ever have"
      item = build(:item,description:description)
      expect(item.description).to eq description
    end
    it "has a restaurant_id" do
      restaurant_id = 5
      item = build(:item,restaurant_id:restaurant_id)
      expect(item.restaurant_id).to eq restaurant_id
    end
    it "has entry_id" do
      entry_id = "1234kj123oh0fwhfl13k4od0f9jhfdl"
      item = build(:item,entry_id:entry_id)
      expect(item.entry_id).to eq entry_id
    end
  end

  describe "Validation" do
    it "validates item entry_id is uniq" do
      restaurant = create(:restaurant)
      item = Item.first
      duplicate = Item.create(attributes_for(:type,entry_id:Item.first.entry_id,restaurant_id:restaurant.id))
      expect(duplicate.errors.messages).to_not be_empty
    end
  end

  describe "Associations" do
    it "has reviews" do
      restaurant = create(:restaurant)
      item = Item.first
      user = create(:user)
      review = Review.create(item_id:item.id,user_id:user.id)
      expect(item.reviews).to_not be_empty
    end
    it "has a restaurant" do
      restaurant = create(:restaurant)
      item = Item.first
      expect(item.restaurant).to eq restaurant
    end

    it "has types" do
      restaurant = create(:restaurant)
      item = Item.first
      full_name =[]
      item.types.each do |type|
        full_name << type.name
      end
      expect(item.types).to_not be_empty
      expect(full_name.join(" ")).to eq item.name
    end
  end
   describe "Can create in database" do
    it "can save" do
      expect{create(:restaurant)}.to change{Item.count}.by(1)
    end
  end
end




