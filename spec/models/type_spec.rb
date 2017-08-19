require 'rails_helper'

RSpec.describe Type, type: :model do
  before(:all) do
    Type.delete_all
    create(:cake)
  end
  describe "Attributes" do
    it "has a name" do
      cheese = build(:type)
      p build(:item )
      expect(cheese.name).to eq "cheese"
    end
  end
  describe "Associations" do
    it "has many Itemtypes" do
      cheese = build(:type)
      expect(cheese.name).to eq "cheese"
    end
    it "has many items" do
      cheese = build(:type)
      expect(cheese.name).to eq "cheese"
    end
  end
  describe "Can create in database" do
    it "Save in to the database" do
      cheese = build(:type)
      expect{cheese.save}.to change{Type.count}.by(1)
    end
    it "can't save if name matches" do
      first = create(:type)
      duplicate = Type.create(attributes_for(:type))
      expect(duplicate.errors.messages).to_not be_empty

    end

    # it "can save if name match" do

    # end
  end
end
