class Recipe < ActiveRecord::Base

  has_many :parts
  has_many :products, through: :parts

  after_find do |r|
    @parts = r.parts
    @rn = r.name
    @rd = r.description
    @ru = r.unit
    @rq = r.quantity
  end

  def avaliable
    pa = []
    @parts.each do |p|
      a = p.avaliable
      pa.push a
    end
    p pa
    pa.min.to_i
  end

  def produce(count)
    @parts.each do |part|
      part.spend(count)
    end

    prd = Product.find_or_initialize_by(name: @rn, description: @rd, unit: @ru)
    pcount = count*@rq

    if prd.persisted?
        "есть немного"
        prd.increase(pcount)
      else
        "ща попробуем!"
        prd.quantity = pcount
    end
    p prd
  end

end
