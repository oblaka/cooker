# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    user nil
    product nil
    quantity 1.5
  end
end
