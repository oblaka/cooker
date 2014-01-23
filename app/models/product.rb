class Product < ActiveRecord::Base

  has_many :parts
  has_many :recipes, through: :parts

  validates :name, lenght: { in: 4..20 }
  validates :description, lenght: { in: 4..255 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :unit, lenght: { in: 2..10 }

  def increase(count)
    self.quantity += count
    self.update(quantity: self.quantity)
  end

  def decrease(count)
    self.quantity -= count
    self.update(quantity: self.quantity)
  end

end
