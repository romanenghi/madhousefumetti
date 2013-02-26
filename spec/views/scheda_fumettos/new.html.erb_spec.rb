require 'spec_helper'

describe "scheda_fumettos/new" do
  before(:each) do
    assign(:scheda_fumetto, stub_model(SchedaFumetto).as_new_record)
  end

  it "renders new scheda_fumetto form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => scheda_fumettos_path, :method => "post" do
    end
  end
end
