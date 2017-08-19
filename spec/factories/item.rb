FactoryGirl.define do
  factory :item do
    name "Cheese Cake"
    price  "$50.00"
    description "The Greatest Chesse Cake by Factory Girl"
    entry_id "1234567890asdfghjkl"

    after :create do |post|
      create :type, item: item             # has_one
    end
  end
end