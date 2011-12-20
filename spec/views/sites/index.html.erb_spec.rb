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

    assert_select 'h1', 'My sites'
    assert_select 'tr>td', :text => 'Name', :count => 2
  end
end
