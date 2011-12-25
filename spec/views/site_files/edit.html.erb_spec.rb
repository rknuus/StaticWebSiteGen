require 'spec_helper'

describe "site_files/edit.html.erb" do
  before(:each) do
    @site_file = assign(:site_file, stub_model(SiteFile,
      :site_id => 1,
      :name => "MyString",
      :path => "MyString"
    ))
  end

  it "renders the edit site_file form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => site_files_path(@site_file), :method => "post" do
      assert_select "input#site_file_site_id", :name => "site_file[site_id]"
      assert_select "input#site_file_name", :name => "site_file[name]"
      assert_select "input#site_file_path", :name => "site_file[path]"
    end
  end
end
