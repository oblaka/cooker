# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipe do
    name "Шарлотка"
    description "Пирог"
    quantity 0.9
    unit "кг"
    correct false
  end
end
