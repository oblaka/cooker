# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "MyString"
    description "MyText"
    quantity 1.5
    unit "MyString"
  end
end
