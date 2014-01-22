require 'spec_helper'

describe Recipe do

  it "counts avaliability" do
    recipe = create(:recipe, id: 1)
    prod1 = create(:product, id: 1, quantity: 8)
    prod2 = create(:product, id: 2, quantity: 10)
    part1 = create(:part, product_id: 1, quantity: 2)
    part2 = create(:part, product_id: 2, quantity: 4)

    expect(recipe.avaliable).to eq(2)
  end

end
