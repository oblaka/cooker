class Part < ActiveRecord::Base

  belongs_to :recipe
  belongs_to :product

  validates :quantity, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates_associated :product

  def name
    product = self.product
    product.name
  end

  def unit
    product = self.product
    product.unit
  end

  def recipe_name
    recipe = self.recipe
    recipe.name
  end

  def avaliable
    user = User.current
    self.reload
    item = user.items.where(product_id: self.product.id).first
    if item.nil?
      0
    else
      item.quantity / self.quantity
    end
  end

  def spend(count)
    item = User.current.items.where(product_id: self.product.id).first
    scount = self.quantity * count
    item.decrease(scount)
  end


end