class Recipe < ActiveRecord::Base

  has_many :parts
  has_many :products, through: :parts

  validates :name, length: { in: 4..20 }, presence: true
  validates :description, length: { in: 4..255 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :unit, length: { in: 2..10 }, presence: true

  def avaliable
    self.reload
    pa = []
    self.parts.each do |p|
      a = p.avaliable
      pa.push a
      p pa
    end
    pa.min.to_i
  end

  def produce(count)
    parts = self.parts
    parts.each do |part|
      part.spend(count.to_i)
    end

    prd = Product.find_or_initialize_by(name: self.name, description: self.description, unit: self.unit)
    pcount = count*self.quantity

    unless prd.persisted?
      prd.quantity = self.quantity
      prd.generated = true
      prd.save
    end

    item = Item.find_or_initialize_by(user_id: User.current.id, product_id: prd.id)

    if item.persisted?
        p "есть немного"
        item.increase(pcount)
      else
        "ща попробуем!"
        item.quantity = pcount
        item.save
    end
  end

end