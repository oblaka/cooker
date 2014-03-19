class PRForm
  include ActiveModel::Model
  attr_accessor :count
  validates :count, numericality: { greater_than_or_equal_to: 0 }, presence: true
end