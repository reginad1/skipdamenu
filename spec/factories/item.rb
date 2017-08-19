FactoryGirl.define do
  factory :item do
    name "Cheese Cake"
    price  "$50.00"
    description "The Greatest Chesse Cake by Factory Girl"
    entry_id "1234567890asdfghjkl"

    after :create do |item|
      item.name.split(" ").each do |name|
        type = create(:type,name:name)
        item.types << type
      end
    end
  end
end
