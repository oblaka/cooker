require 'spec_helper'

describe "parts/index" do
  before(:each) do
    assign(:parts, [
      stub_model(Part),
      stub_model(Part)
    ])
  end

  it "renders a list of parts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
