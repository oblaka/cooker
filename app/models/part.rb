class Part < ActiveRecord::Base

  belongs_to :recipe
  belongs_to :product

  validates :quantity, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates_associated :product

  def name
    product = self.product
    product.name
  end

  def recipe_name
    recipe = self.recipe
    recipe.name
  end

  def avaliable
    self.reload
    product = self.product
    product.quantity.to_f / self.quantity.to_f
  end

  def spend(count)
    scount = self.quantity * count
    product = self.product
    product.decrease(scount)
  end


end