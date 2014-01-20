# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :part, :class => 'Parts' do
    quantity 1.5
    recipe nil
    product nil
    positive false
  end
end
