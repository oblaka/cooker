# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipe do
    name "MyString"
    description "MyText"
    quantity 1.5
    unit "MyString"
    correct false
  end
end
