class Product < ActiveRecord::Base

  has_many :parts
  has_many :recipes, through: :parts


  def increase(count)
    self.quantity += count
    self.update(quantity: self.quantity)
  end

  def decrease(count)
    self.quantity -= count
    self.update(quantity: self.quantity)
  end

end
