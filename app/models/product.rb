class Product < ActiveRecord::Base

  has_many :parts
  has_many :recipes, through: :parts

  after_find do |p|
    @quantity = self.quantity
  end

  def increase(count)
    @quantity += count
    self.update(quantity: @quantity)
  end

  def decrease(count)
    @quantity -= count
    self.update(quantity: @quantity)
  end

end
