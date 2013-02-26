require 'spec_helper'

describe "scheda_fumettos/show" do
  before(:each) do
    @scheda_fumetto = assign(:scheda_fumetto, stub_model(SchedaFumetto))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
