# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :part do
    association(:recipe)
    association(:product)
    quantity 1.5
    positive false
  end
end
