require 'spec_helper'

describe "site_files/new.html.erb" do
  before(:each) do
    @site_text = assign(:site_file, stub_model(SiteFile,
      :name => "MyString",
      :path => "MyString"
    ).as_new_record)
    @site_text.site = assign(:site, stub_model(Site,
      :name => "MyString",
      :template => "MyText"
    ))
  end

  it "renders new site_file form" do
    render

    assert_select "form", :action => site_files_path, :method => "post" do
      assert_select "input#site_file_site_id", :name => "site_file[site_id]"
      assert_select "input#site_file_name", :name => "site_file[name]"
      assert_select "input#site_file_path", :name => "site_file[path]"
      assert_select "input#site_file_source_path", :name => "site_file[source_path]"
    end
  end
end
