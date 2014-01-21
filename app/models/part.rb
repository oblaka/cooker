class Part < ActiveRecord::Base

  belongs_to :recipe
  belongs_to :product

  after_find do |part|
    @product = self.product
    @pq = product.quantity
    @sq = self.quantity
  end

  def name
    @product.name
  end

  def avaliable
    a = @pq / @sq
  end

  def spend(count)
    scount = @sq * count
    @product.decrease(scount)
  end


end