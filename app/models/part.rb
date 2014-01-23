class Part < ActiveRecord::Base

  belongs_to :recipe
  belongs_to :product

  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  validates_associated :product

  def name
    product = self.product
    product.name
  end

  def avaliable
    product = self.product
    product.quantity / self.quantity
  end

  def spend(count)
    scount = self.quantity * count
    product = self.product
    product.decrease(scount)
  end


end