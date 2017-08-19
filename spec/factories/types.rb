FactoryGirl.define do
  factory :type do
    name "cheese"
  end
  factory :cheese, class: Type do
    name "cheese"
  end
  factory :cake, class: Type do
    name "cake"
  end
end