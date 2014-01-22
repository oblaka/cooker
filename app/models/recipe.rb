class Recipe < ActiveRecord::Base

  has_many :parts
  has_many :products, through: :parts

  def avaliable
    pa = []
    self.parts.each do |p|
      a = p.avaliable
      pa.push a
    end
    pa.min.to_i
  end

  def produce(count)
    if self.avaliable < count
      raise "Не хватает ресурсов"
    else
      parts = self.parts
      parts.each do |part|
        part.spend(count)
      end

      prd = Product.find_or_initialize_by(name: self.name, description: self.description, unit: self.unit)
      pcount = count*self.quantity

      if prd.persisted?
          "есть немного"
          prd.increase(pcount)
        else
          "ща попробуем!"
          prd.quantity = pcount
          prd.save
      end
    end
  end

end