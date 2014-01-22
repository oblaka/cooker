require 'spec_helper'

describe Product do

  it "increase quantity" do
    prod = create(:product, quantity: 10)

    prod.increase(3)
    expect(prod.quantity).to eq(13)
  end

  it "decrease quantity" do
    prod = create(:product, quantity: 10)

    prod.decrease(3)
    expect(prod.quantity).to eq(7)
  end

end
