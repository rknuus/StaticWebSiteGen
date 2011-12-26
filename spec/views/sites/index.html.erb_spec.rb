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
    assert_select 'tr>td>a', :text => 'Edit site', :count => 2
    assert_select 'tr>td>a', :text => 'Edit globals', :count => 2
    assert_select 'tr>td>a', :text => 'Pages', :count => 2
    assert_select 'tr>td>a', :text => 'Destroy', :count => 2
    assert_select 'a', 'New site'
  end
end
