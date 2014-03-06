class Recipe < ActiveRecord::Base

  has_many :parts
  has_many :products, through: :parts

  validates :name, length: { in: 4..20 }, presence: true
  validates :description, length: { in: 4..255 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :unit, length: { in: 2..10 }, presence: true

  def avaliable(uid)
    self.reload
    pa = []
    self.parts.each do |p|
      a = p.avaliable(uid)
      pa.push a
      p pa
    end
    pa.min.to_i
  end

  def produce(count)
    if self.avaliable < count
      raise "Не хватает ресурсов"
    else
      parts = self.parts
      parts.each do |part|
        part.spend(count.to_i)
      end

      prd = Product.find_or_initialize_by(name: self.name, description: self.description, unit: self.unit)
      pcount = count*self.quantity

      if prd.persisted?
          p "есть немного"
          prd.increase(pcount)
        else
          "ща попробуем!"
          prd.quantity = pcount
          prd.save
      end
    end
  end

end