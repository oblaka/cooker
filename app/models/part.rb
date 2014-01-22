class Part < ActiveRecord::Base

  belongs_to :recipe
  belongs_to :product

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
    scount
  end


end