class CountType

  include ActiveModel::Validations

  attr_accessor :count

  validates_numericality_of :count, greater_than: 0, message: 'must be greater than Zero'

end