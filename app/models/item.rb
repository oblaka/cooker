class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :quantity, numericality: { greater_than_or_equal_to: 0 }, presence: true

  scope :owned, -> { where(user_id: User.current.id) }

  def description
    product = self.product
    product.description
  end

  def name
    product = self.product
    product.name
  end

  def unit
    product = self.product
    product.unit
  end

   def increase(count)
    self.quantity += count
    self.update(quantity: self.quantity.round(2))
  end

  def decrease(count)
    self.quantity -= count
    self.update(quantity: self.quantity.round(2))
  end

end
