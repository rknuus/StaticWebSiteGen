require 'spec_helper'

describe "site_files/show.html.erb" do
  before(:each) do
    @site_file = assign(:site_file, stub_model(SiteFile,
      :name => "Name",
      :path => "Path",
      :source_path => 'SourcePath'
    ))
    @site_file.site = assign(:site, stub_model(Site,
      :name => "MyString",
      :template => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render

    assert_select 'p', :count => 3
    assert_select 'p>b', :text => 'Name:'
    assert_select 'p', :text => "Name:\n  Name"
    assert_select 'p>b', :text => 'Path:'
    assert_select 'p', :text => "Path:\n  Path"
    assert_select 'p>b', :text => 'Source path:'
    assert_select 'p', :text => "Source path:\n  SourcePath"
  end
end
