require 'rails_helper'

RSpec.describe Type, type: :model do
  before(:all) do
    Type.delete_all

  end
  describe "Attributes" do
    it "has a name" do
      cheese = build(:type,name:"cheese")
      expect(cheese.name).to eq "cheese"
    end
  end
  describe "Associations" do
    it "has many items" do
      item = create(:restaurant)
      type = Type.first
      expect(type.items).to_not be_empty
    end
  end
  describe "Can create in database" do
    it "Save in to the database" do
      cheese = build(:type,name:"cheese")
      expect{cheese.save}.to change{Type.count}.by(1)
    end
    it "can't save if name matches" do
      first = create(:type,name:"cheese")
      duplicate = Type.create(attributes_for(:type,name:"cheese"))
      expect(duplicate.errors.messages).to_not be_empty

    end
  end
end
