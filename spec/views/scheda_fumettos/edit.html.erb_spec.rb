require 'spec_helper'

describe "scheda_fumettos/edit" do
  before(:each) do
    @scheda_fumetto = assign(:scheda_fumetto, stub_model(SchedaFumetto))
  end

  it "renders the edit scheda_fumetto form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => scheda_fumettos_path(@scheda_fumetto), :method => "post" do
    end
  end
end
