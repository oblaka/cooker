require 'spec_helper'

describe Part do

  it "returns name of product" do
    prod = create(:product, name: "Eggs", id: 1)
    part = create(:part, product_id: 1)

    expect(part.name).to eq("Eggs")
  end

  it "counts avaliability" do
    prod = create(:product, id: 1, quantity: 10)
    part = create(:part, product_id: 1, quantity: 4)

    expect(part.avaliable).to eq(2.5)
  end

  it "spend product" do
    prod = create(:product, id: 1, quantity: 10)
    part = create(:part, product_id: 1, quantity: 4)

    expect(part.avaliable).to eq(2.5)
    part.spend(2.0)
    expect(part.avaliable).to eq(0.5)
  end

end
