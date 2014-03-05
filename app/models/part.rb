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

  def avaliable(@user)
    self.reload
    product = self.product
    item = @user.items.where(product_id: product.id)
    item.quantity / self.quantity
  end

  def spend(count)
    scount = self.quantity * count
    product = self.product
    product.decrease(scount)
  end


end