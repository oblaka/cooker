class ProduceRecipeForm
  include ActiveModel::Validations
  attr_accessor :count
  validates :count, numericality: { greater_than_or_equal_to: 0 }, presence: true
end