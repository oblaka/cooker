class Product < ActiveRecord::Base

  has_many :parts
  has_many :recipes, through: :parts
  has_many :items
  has_many :users, through: :items

  validates :name, length: { in: 4..20 }, presence: true
  validates :description, length: { in: 4..255 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :unit, length: { in: 2..10 }, presence: true

  def item_increase(uid, count)
    item = Item.find_or_initialize_by(user_id: uid, product_id: prd.id)
    self.quantity += count
    self.update(quantity: self.quantity.round(2))
  end

  def increase(count)
    item = Item.find_or_initialize_by(user_id: uid, product_id: prd.id)
    self.quantity += count
    self.update(quantity: self.quantity.round(2))
  end

  def decrease(count)
    self.quantity -= count
    self.update(quantity: self.quantity.round(2))
  end

end
