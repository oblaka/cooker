require 'spec_helper'

describe Recipe do

  it "counts avaliability" do
    recipe = create(:recipe)
    prod1 = create(:product, quantity: 8)
    prod2 = create(:product, quantity: 10)
    part1 = create(:part, recipe_id: recipe.id, product_id: prod1.id, quantity: 2)
    part2 = create(:part, recipe_id: recipe.id, product_id: prod2.id, quantity: 4)

    expect(recipe.avaliable).to eq(2)
    recipe.produce(1)
    expect(recipe.avaliable).to eq(1)
  end

  it "raises exeption if produce count over avaliability" do
    recipe = create(:recipe)
    prod1 = create(:product, quantity: 8)
    prod2 = create(:product, quantity: 10)
    part1 = create(:part, recipe_id: recipe.id, product_id: prod1.id, quantity: 2)
    part2 = create(:part, recipe_id: recipe.id, product_id: prod2.id, quantity: 4)

    expect( -> { recipe.produce(5) } ).to raise_error
  end

  it "produce new product" do
    recipe = create(:recipe, name: "Cake", quantity: 1.5)
    prod1 = create(:product, quantity: 8)
    prod2 = create(:product, quantity: 12)
    part1 = create(:part, recipe_id: recipe.id, product_id: prod1.id, quantity: 2)
    part2 = create(:part, recipe_id: recipe.id, product_id: prod2.id, quantity: 3)

    expect(Product.find_by_name("Cake")).to eq(nil)
    expect(prod1.quantity).to eq(8)
    expect(prod2.quantity).to eq(12)

    recipe.produce(2)
    prod1.reload
    prod2.reload

    expect(Product.find_by_name("Cake").quantity).to eq(3)
    expect(prod1.quantity).to eq(4)
    expect(prod2.quantity).to eq(6)
  end

end