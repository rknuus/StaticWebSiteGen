require 'spec_helper'

describe "site_files/index.html.erb" do
  before(:each) do
    assign(:site_files, [
      stub_model(SiteFile,
        :site_id => 1,
        :name => "Name",
        :path => "Path"
      ),
      stub_model(SiteFile,
        :site_id => 1,
        :name => "Name",
        :path => "Path"
      )
    ])
  end

  it "renders a list of site_files" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Path".to_s, :count => 2
  end
end
