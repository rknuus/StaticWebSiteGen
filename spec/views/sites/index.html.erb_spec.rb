require 'spec_helper'

describe "sites/index.html.erb" do
  before(:each) do
    assign(:sites, [
      stub_model(Site,
        :name => "Name"
      ),
      stub_model(Site,
        :name => "Name"
      )
    ])
  end

  it "renders a list of sites" do
    render
    # rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
