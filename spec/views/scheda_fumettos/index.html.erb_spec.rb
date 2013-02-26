require 'spec_helper'

describe "scheda_fumettos/index" do
  before(:each) do
    assign(:scheda_fumettos, [
      stub_model(SchedaFumetto),
      stub_model(SchedaFumetto)
    ])
  end

  it "renders a list of scheda_fumettos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
