# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :part do
    association(:recipe)
    association(:product, id: 1)
    quantity 1.5
    positive false
  end
end
