require 'spec_helper'

describe "parts/edit" do
  before(:each) do
    @part = assign(:part, stub_model(Part))
  end

  it "renders the edit part form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", part_path(@part), "post" do
    end
  end
end
