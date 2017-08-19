FactoryGirl.define do
  factory :restaurant do
    name "Franklin's"
    google_id   "qwertyuiop1234567890"
    foursq_id   "qwertyuiop1234567890"
    longitude   "-96.7922304"
    latitude    "32.7657187"

    after (:create) do |restaurant|
      item = create(:item,restaurant_id:restaurant.id)
      restaurant.items << item
    end
  end
end
