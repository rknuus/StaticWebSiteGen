require 'spec_helper'

describe "page_files/show.html.erb" do
  before(:each) do
    @page_file = assign(:page_file, stub_model(PageFile,
      :name => "Name",
      :path => "Path",
      :source_path => 'SourcePath'
    ))
    @page_file.page = assign(:page, stub_model(Page,
      :name => "MyString",
      :content => "MyText",
      :source_path => 'SourcePath'
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
