# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    sequence(:name)  { |i| "Product#{i}" }
    description "Bla-bla-bla"
    quantity 1.5
    unit "kg"
  end
end
